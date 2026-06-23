---
name: readme-writer
version: 1.1.0
license: MIT
description: >
  Generate production-quality README.md for any project by analyzing its codebase,
  tech stack, and structure. Based on Best-README-Template (othneildrew).
triggers:
  - "写readme"
  - "写README"
  - "生成readme"
  - "帮我写readme"
  - "generate readme"
  - "create readme"
tags:
  - documentation
  - readme
  - github
  - onboarding
exclusions:
  - "不润色现有文案 → write"
  - "不做知识库 wiki → llm-wiki"
  - "不做 token-based 设计落地页 → kami"
  - "不做 API 参考文档"
---

# README Writer

Generate a complete, production-quality `README.md` for any project.

## Workflow

### Phase 1: Codebase Analysis

Before writing, gather these facts from the project:

1. **Identity**: project name, description, author, license
2. **Tech stack**: languages, frameworks, libraries (check package.json, requirements.txt, go.mod, Cargo.toml, pom.xml, etc.)
3. **Entry points**: main files, CLI commands, API routes
4. **Install & run**: how to set up locally (dependencies, env vars, build steps)
5. **Project structure**: key directories and their purpose
6. **Existing docs**: any README, CONTRIBUTING, LICENSE already present

Use `ctx_batch_execute` or direct file reads. Do NOT guess — read actual config files.

### Phase 2: Section Assembly

Generate each section following the template structure in [references/template-structure.md](references/template-structure.md).

Section order (fixed):

```
1. Shields / Badges
2. Project Logo + Title + Tagline
3. Table of Contents (collapsible)
4. About The Project
   └── Built With
5. Getting Started
   ├── Prerequisites
   └── Installation
6. Usage
7. Roadmap (optional)
8. Contributing
9. License
10. Contact
11. Acknowledgments
12. Reference-Style Link Definitions
```

### Phase 3: Output

Write the README.md to the project root. Return the file path.

## Rules

1. **Never fabricate** — if you can't determine a fact (license, author, install steps), use a placeholder with `<!-- TODO: ... -->` comment
2. **Back-to-top links** after every major section: `<p align="right">(<a href="#readme-top">back to top</a>)</p>`
3. **Reference-style badges** — define all badge URLs at the bottom of the file
4. **Collapsible TOC** using `<details><summary>Table of Contents</summary>...</details>`
5. **Centered header** using `<div align="center">` with logo, title, description, and action links
6. **Code blocks** with language hints for all commands
7. **Shields.io badges** for: contributors, forks, stars, issues, license, LinkedIn (when applicable)
8. **Adapt sections** — skip Roadmap if no milestones exist; skip Acknowledgments if none; always include About, Getting Started, Usage, License, Contact

## Quality Checklist

Before delivering, verify:

- [ ] Every `<img>` or badge URL references a real endpoint or uses shields.io pattern
- [ ] Installation steps are actually runnable (not copy-paste from template)
- [ ] TOC anchors match section headings exactly
- [ ] Reference-style links at bottom match all `[text][ref]` usages above
- [ ] No leftover placeholder text (`project_title`, `github_username`) without `<!-- TODO -->` markers

## Adaptation Guide

| Project Type | Emphasize | Skip/Minimize |
|---|---|---|
| CLI tool | Usage examples, flags, config | Screenshots |
| Web app | Screenshots, demo link, deployment | CLI flags |
| Library | API reference, install, usage snippets | Roadmap |
| Monorepo | Architecture diagram, package list | Single install steps |
| Internal tool | Setup, env vars, team contacts | Contributing (use `standard` template) |

## Reference Map

- [Template Structure](references/template-structure.md) — full section spec with HTML/Markdown patterns
- [Badge Catalog](references/badge-catalog.md) — shields.io badge patterns and common combos
- [Best Practices](references/best-practices.md) — do's and don'ts from top OSS READMEs

## Personalization via user.json

The skill reads an optional `user.json` to pre-fill recurring fields. Recognized fields:

| Field | Used For |
|---|---|
| `github.username` | Replaces `OWNER` in badge URLs and GitHub links |
| `open_source.default_license` | Pre-fills the License section when the project has no LICENSE file |
| `open_source.acknowledgments[]` | Auto-inserted into the Acknowledgments section |
| `sponsorship.*` | Added to Acknowledgments and `.github/FUNDING.yml` |

**Location:** `<skill_install_dir>/user.json` — for example `~/.claude/skills/readme-writer/user.json`. It is **skill-internal**, not per-project: one `user.json` per skill install, shared across every project the skill touches.

`user.json` is **never committed** when open-sourcing the skill. The skill ships with `.gitignore` excluding it. The maintainer's local copy lives only on their machine.

## Language Support

Generated READMEs are produced as a **two-file bilingual pair** by default:

- `README.md` — English (GitHub renders this by default)
- `README.zh-CN.md` — Simplified Chinese

Both files cross-link via a top-of-file toggle:

```markdown
<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**
```

GitHub renders `README.md` by default regardless of browser language; the toggle is the manual switch.

Override via the `language` input:

| Value | Output |
|---|---|
| `both` (default) | Both files with cross-link toggle |
| `en` | Only `README.md`, English only |
| `zh-CN` | Only `README.zh-CN.md`, Chinese only |
