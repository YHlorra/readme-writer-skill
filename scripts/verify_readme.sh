#!/usr/bin/env bash
# verify_readme.sh - smoke-test a README for skill-compatibility issues.
# Usage: bash scripts/verify_readme.sh [path/to/README.md]
# Exit 0 = pass, exit 1 = at least one hard failure.
#
# Optional: reads user.json from the skill install path (skill-internal, lives
# next to SKILL.md) to surface a default GitHub username and suggest a sed
# one-liner for replacing the OWNER placeholder. The script does NOT search the
# project or workspace — user.json is per-skill-install, not per-project.

set -e

TARGET="${1:-README.md}"

if [[ ! -f "$TARGET" ]]; then
  echo "ERROR: $TARGET not found" >&2
  exit 1
fi

echo "Target: $TARGET"
echo ""

fail=0

# Locate user.json at the skill install path (script's parent's parent).
default_owner=""
script_dir="$(cd "$(dirname "$0")" && pwd 2>/dev/null)"
skill_root="$(dirname "$script_dir" 2>/dev/null)"
user_json="$skill_root/user.json"
if [[ -f "$user_json" ]]; then
  _u=$(grep -oE '"username"[[:space:]]*:[[:space:]]*"[^"]+"' "$user_json" 2>/dev/null | head -1 | sed -E 's/.*"username"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')
  if [[ -n "$_u" ]]; then
    default_owner="$_u"
    echo "[info] user.json: $user_json (default owner: $default_owner)"
  fi
fi
echo ""

# 1. shields.io badge count
n=$(grep -c 'img.shields.io' "$TARGET" || true)
echo "[1] shields.io badges: $n"
if [[ "$n" -lt 3 ]]; then
  echo "    WARN: recommend >= 3 badges"
fi

# 2. raw placeholder hygiene
m=$(grep -cE 'github_username|repo_name|project_title|YOUR_USERNAME' "$TARGET" || true)
echo "[2] raw placeholders: $m"
if [[ "$m" -gt 0 ]]; then
  echo "    FAIL: replace before publishing"
  fail=1
fi

# 2b. OWNER placeholder (informational; suggest user.json replacement if available)
owner_count=$(grep -cE '\bOWNER\b' "$TARGET" || true)
if [[ "$owner_count" -gt 0 ]]; then
  echo "[2b] OWNER placeholder occurrences: $owner_count"
  if [[ -n "$default_owner" ]]; then
    echo "     hint: sed -i 's|OWNER|$default_owner|g' $TARGET"
  fi
fi

# 3. TOC anchors -> heading match (loose: substring of slug appears in file)
# Recognizes English ("Table of Contents") and Chinese ("目录") summary labels.
toc=$(awk '/<summary>(Table of Contents|目录|目錄|Table des matières|Inhaltsverzeichnis)<\/summary>/{f=1;next} /<\/details>/{f=0} f' "$TARGET")
if [[ -n "$toc" ]]; then
  orphans=0
  while IFS= read -r a; do
    [[ -z "$a" ]] && continue
    if ! grep -qF "$a" "$TARGET"; then
      echo "    FAIL: orphan TOC anchor #$a"
      orphans=$((orphans + 1))
    fi
  done < <(echo "$toc" | grep -oE '\(#[a-z0-9-]+\)' | sed 's/[()]//g; s/^#//' | sort -u)
  echo "[3] TOC orphan anchors: $orphans"
  if [[ "$orphans" -gt 0 ]]; then
    fail=1
  fi
else
  echo "[3] TOC: skipped (no collapsible TOC)"
fi

# 4. reference-style links: defined vs used
used=$(grep -oE '\]\[[a-zA-Z0-9_-]+\]' "$TARGET" | sed -E 's/^\]\[(.*)\]$/\1/' | sort -u || true)
defn=$(grep -oE '^\[[a-zA-Z0-9_-]+\]: ' "$TARGET" | sed 's/^\[//; s/\]: //' | sort -u || true)

undef=0
for u in $used; do
  [[ -z "$u" ]] && continue
  if ! echo "$defn" | grep -qxF "$u"; then
    echo "    FAIL: [..][$u] used but not defined"
    undef=$((undef + 1))
  fi
done

# unused definitions (warn-only)
unused=0
for d in $defn; do
  [[ -z "$d" ]] && continue
  if ! echo "$used" | grep -qxF "$d"; then
    unused=$((unused + 1))
  fi
done

echo "[4] undefined references: $undef, unused definitions: $unused"
if [[ "$undef" -gt 0 ]]; then
  fail=1
fi

# 5. TODO markers (informational)
todos=$(grep -cE '<!--\s*TODO' "$TARGET" || true)
echo "[5] TODO markers: $todos (review before publishing)"

echo ""
if [[ "$fail" -gt 0 ]]; then
  echo "RESULT: FAIL"
  exit 1
fi
echo "RESULT: PASS"