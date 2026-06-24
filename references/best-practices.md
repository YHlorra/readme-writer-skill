# README Best Practices

Distilled from top OSS projects, 2024+ standard. Links to the canonical [Template Structure][template-structure] for section specs.

[template-structure]: ./template-structure.md

---

## Do

1. **Lead with what, not how** — first paragraph states what the project does
2. **One-command install** — ideal: `npm install && npm start`. Number remaining steps
3. **Show, don't tell** — screenshots, GIFs, code snippets over prose
4. **Working code examples** — every block is copy-pasteable and runnable
5. **License + Version + Last Commit badges** — the 3 defaults; add Stars/Issues/Contributors conditionally
6. **Collapsible TOC** — keeps long READMEs scannable
7. **Back-to-top links** — essential for READMEs over 3 sections
8. **Reference-style links** — keeps body readable with many badges
9. **Adapt to audience** — library ≠ webapp ≠ CLI tool
10. **Keep it updated** — stale README is worse than no README

---

## Don't

1. **Don't paste raw URLs** — use `[text](url)` or reference-style links
2. **Don't use absolute image paths** — use relative (`images/screenshot.png`)
3. **Don't list every dependency** — top 3-5 in "Built With", full list in package files
4. **Don't write a manual** — README is a landing page. Link to docs
5. **Don't use HTML for everything** — Markdown where possible, HTML only for alignment/layout
6. **Don't forget mobile** — constrain image widths
7. **Don't use `master`** — use `main` in all examples
8. **Don't leave placeholders unfilled** — fill them or mark `<!-- TODO -->`
9. **Don't duplicate CONTRIBUTING.md** — link to it unless it doesn't exist or is < 100 bytes
10. **Don't skip the license** — unlicensed code is legally ambiguous

---

## Section Rendering Quick Reference

For full detection rules, see [Template Structure][template-structure].

| Section | Render When |
|---------|-------------|
| Configuration | `.env.example` / `config/` / `app.config.*` / `settings.py` / `.envrc` exists |
| Testing | `tests/` / `__tests__/` / `vitest.config.*` / `pytest.ini` / `*_test.go` / `package.json` has `test` script |
| Deployment | `Dockerfile` / `docker-compose.yml` / `vercel.json` / `netlify.toml` / `fly.toml` / `.github/workflows/deploy*` exists |
| Security | `SECURITY.md` exists only |
| Architecture | `docs/architecture.md` / `ARCHITECTURE.md` / `docs/design.md` exists OR monorepo/webapp type |
| FAQ | **Never auto-generate** — manual heading + hint comment only |
| Roadmap | `ROADMAP.md` exists OR `<!-- ENABLE_ROADMAP -->` directive present |

---

## Component Decision Rules

| Component | Default | Opt-out / Opt-in |
|-----------|---------|------------------|
| Star History | On when stars > 50 | `<!-- DISABLE_STAR_HISTORY -->` to disable |
| Mermaid | Empty ` ```mermaid ` block + `<!-- TODO -->` placeholder | Only when Architecture section renders |
| Dynamic shields | Auto-detect CI / coverage / downloads | Fallback `<!-- TODO -->` if not detected |
| GitHub Stats card | **Off** | Opt-in only; not auto-generated |

**Plain `<a><img>` wrapping** for Star History — no `<div>` wrapper. Graceful degradation when image service is down.

---

## Badge Hygiene

| Badge | Condition |
|-------|-----------|
| License | **Always** — default |
| Version | **Always** — default |
| Last Commit | **Always** — default |
| Stars | `user.json` opt-in (`star_count` present) |
| Issues | **Default on** — GitHub native |
| Contributors | **Monorepo only** |
| ~~Forks~~ | **Removed** — noise for internal/personal tools |
| ~~LinkedIn~~ | **Removed** — not needed for internal/personal tools |

---

## Contributing: Inline vs. Link

| Condition | Action |
|-----------|--------|
| `CONTRIBUTING.md` exists and ≥ 100 bytes | Link: `See [CONTRIBUTING.md](./CONTRIBUTING.md)` |
| `CONTRIBUTING.md` missing or < 100 bytes | Inline: Fork → Branch → PR → Open PR |

---

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| `npm install` without specifying package manager | State which: `npm install`, `yarn`, `pnpm install` |
| "See the docs" with no link | Add the actual URL |
| Screenshot is 3MB+ | Compress to < 500KB, use WebP |
| TOC links don't work | Anchors must match headings exactly (use `grep -E '^#+\s'`) |
| Badges point to wrong repo | Double-check `OWNER/REPO` in every shield URL |
| "Fork this repo" in a private project | Remove or replace with internal contribution guide |
| CJK anchor slugs | Use English slugs everywhere: `#configuration`, `#testing` |

---

## Project Type Quick Reference

| Type | Must-Have Sections |
|------|---------------------|
| **CLI** | About, Install, Usage (with flags/examples), License |
| **Library** | About, Install, Quick Start, API/Usage, License |
| **Webapp** | About, Screenshot/Demo, Getting Started, Environment Setup, License |
| **Monorepo** | About, Architecture overview, Package list, Local dev setup, License |
| **Internal tool** | About, Getting Started, Configuration, Usage, License |

For detailed section specs per type, see [Template Structure][template-structure].
