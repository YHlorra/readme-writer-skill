# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

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