# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.2.0] - 2026-06-24

### Added
- **5 new auto-detected sections.** Configuration, Testing, Deployment, Security (conditional on `SECURITY.md`), Architecture (conditional on docs or monorepo/webapp type). Each section has detection triggers documented in `references/template-structure.md`.
- **FAQ section (manual-only).** No auto-detection — heading + hint comment for community-maintained content.
- **Modern components catalog.** Star History chart (default on when stars > 50, opt-out via `<!-- DISABLE_STAR_HISTORY -->`), Mermaid architecture diagram (empty block + TODO placeholder, no starter template), dynamic shields (auto-detect CI/coverage/downloads), GitHub Stats card (opt-in third-party only).
- **Bilingual section translation table.** Locked canonical CN translations for all new sections in `references/template-structure.md` §0. Fixers consult the table — no auto-translation.
- **Anchor slug convention.** English slugs everywhere, even in zh-CN files (anchor stability across locales).
- **Monorepo detection heuristic.** File-based: `lerna.json` / `pnpm-workspace.yaml` / `turbo.json` / `nx.json` / multiple root `package.json`. Used by Architecture trigger and Contributors badge.
- **Roadmap opt-in directive.** `<!-- ENABLE_ROADMAP -->` comment directive (parallel to `<!-- DISABLE_STAR_HISTORY -->`). Roadmap only renders when directive present or `ROADMAP.md` exists.
- `scripts/verify_readme.sh` check 6: required-section presence with bilingual support (accepts English or Chinese headings). Strict/sample modes via `--sample` flag.
- `scripts/verify_readme.sh` check 7: Mermaid language hint warning (warns when diagram-like content lacks ` ```mermaid ` hint).

### Changed
- **Default badge set tightened from 6 to 3.** License + Version + Last Commit. Removed: Forks (noise), LinkedIn (not needed for internal/personal tools). Optional: Stars (user.json opt-in), Issues (default on), Contributors (monorepo only).
- **Contributing default changed.** Now links to `CONTRIBUTING.md` instead of inline Fork→Branch→PR template. Inline fallback only when file missing or < 100 bytes.
- **Roadmap strong-skip.** Only renders when `ROADMAP.md` exists or `<!-- ENABLE_ROADMAP -->` directive present. Previous behavior: always rendered with placeholder content.
- **Security section is conditional.** Only renders when `SECURITY.md` exists. Previous behavior: none (section didn't exist).
- `templates/BLANK_README.md` rewritten — sparse placeholders (TODO/OPTIONAL comments) instead of full code blocks. Optional sections wrapped in commented-out blocks with detection trigger hints.
- `examples/output/README.md` + `README.zh-CN.md` regenerated — demonstrates "do not over-render" principle (only Testing triggers for hello-counter sample project).
- `examples/output/README.zh-CN.md` anchor slugs changed from CJK to English (e.g., `#关于本项目` → `#about-the-project`).
- `references/best-practices.md` modernized — Section Rendering Quick Reference table, Component Decision Rules table, Badge Hygiene table, Contributing inline-vs-link heuristic, anchor slug consistency in Common Mistakes.
- `SKILL.md` Phase 2 section tree replaced with pointer to `references/template-structure.md` (single source of truth).

### Fixed
- `references/template-structure.md` inner code-block closing fences (6 locations had 2 backticks instead of 3).
- Self-referential comment in Star History section (referenced itself instead of the parallel `ENABLE_ROADMAP` convention).
- Last-commit shield URL missing `.svg` extension.
- Duplicate URL definitions in Section 2 consolidated.

## [1.1.0] - 2026-06-23

### Added
- **Bilingual default output.** Generated READMEs are now produced as a two-file pair: `README.md` (English) + `README.zh-CN.md` (Chinese), each cross-linked via a top-of-file toggle. Override via the new `language` input (`both` / `en` / `zh-CN`).
- **Personalization via `user.json`.** Skill reads an optional `user.json` for `github.username`, default license, acknowledgments, and sponsorship links. Search order: project root -> workspace root -> `~/.config/readme-writer/`.
- `templates/BLANK_README.zh-CN.md` — Chinese blank template, mirroring the English one.
- Language toggle at the top of `templates/BLANK_README.md` and `examples/output/README.md`.
- `scripts/verify_readme.sh` now reports the default GitHub username loaded from `user.json` (when present) and suggests an `OWNER` -> `<username>` replacement.
- `.gitignore` — excludes `user.json` and `/output/`.
- `examples/output/README.zh-CN.md` — Chinese version of the example output.

### Changed
- `templates/BLANK_README.md` placeholder tokens renamed to UPPERCASE (`OWNER`, `REPO`, `PROJECT_TITLE`, `PROJECT_DESCRIPTION`, `PROJECT_LICENSE`, `TWITTER_HANDLE`, `LINKEDIN_USERNAME`, `EMAIL_CLIENT`, `EMAIL`). They no longer collide with the verifier's raw-placeholder check.
- Trigger set narrowed from 10 to 6 (`项目文档`, `项目说明`, `readme`, `readme怎么写` removed) to avoid collisions with `write` / `llm-wiki` / `kami`.
- `agents/interface.yaml` `outputs.readme_path` split into `readme_path_en` and `readme_path_zh`.

### Notes
- `user.json` is local personalization data and is **not committed** when open-sourcing this skill. It lives at the skill install path (`~/.claude/skills/readme-writer/user.json`) and is **skill-internal, not per-project** — one file shared across every project the skill touches. The skill's own `.gitignore` excludes it.

## [1.0.0] - 2026-06-23

### Added
- Initial release
- 3-phase workflow: codebase analysis -> section assembly -> verification
- Anti-fabrication rule: never invent license, author, or install steps; use `<!-- TODO -->` markers when unknown
- Quality checklist: badge URLs, TOC anchors, reference-link closure, placeholder hygiene
- `agents/interface.yaml` runtime contract with template variants (`standard`, `minimal`, `library`, `cli`, `webapp`, `monorepo`)
- Blank README template (Best-README-Template derivative)
- References: template structure, badge catalog, best practices
- Adaptation guide for CLI / web app / library / monorepo / internal-tool project types
- Examples: minimal fixture project with input/output README pair
- `scripts/verify_readme.sh`: badge / TOC / reference-link sanity check
- `LICENSE` (MIT) and this changelog