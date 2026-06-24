---
name: readme-writer
version: 1.2.0
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

Generate each section following the template structure in [references/template-structure.md](references/template-structure.md) (single source of truth for section order, detection triggers, CN translation table, and rendering rules).

### Phase 3: Output

Write the README.md to the project root. Return the file path.

## Rules

1. **Never fabricate** — if you can't determine a fact (license, author, install steps), use a placeholder with `<!-- TODO: ... -->` comment
2. **Back-to-top links** after every major section: `<p align="right">(<a href="#readme-top">back to top</a>)</p>`
3. **Reference-style badges** — define all badge URLs at the bottom of the file
4. **Collapsible TOC** using `<details><summary>Table of Contents</summary>...</details>`
5. **Centered header** using `<div align="center">` with logo, title, description, and action links
6. **Code blocks** with language hints for all commands
7. **Default badges**: License + Version + Last Commit (3). Optional: Stars (user.json opt-in), Issues (default on), Contributors (monorepo only). Removed: Forks, LinkedIn.
8. **Adapt sections** — skip Roadmap unless `ROADMAP.md` exists or `<!-- ENABLE_ROADMAP -->` present; skip Acknowledgments if none; always include About, Getting Started, Usage, License, Contact.

## Quality Checklist

Before delivering, verify:

- [ ] Every `<img>` or badge URL references a real endpoint or uses shields.io pattern
- [ ] Installation steps are actually runnable (not copy-paste from template)
- [ ] TOC anchors match section headings exactly
- [ ] Reference-style links at bottom match all `[text][ref]` usages above
- [ ] No leftover placeholder text (`project_title`, `github_username`) without `<!-- TODO -->` markers

## Reference Map

- [Template Structure](references/template-structure.md) — section spec, detection triggers, CN translation table, modern components
- [Badge Catalog](references/badge-catalog.md) — shields.io badge patterns
- [Best Practices](references/best-practices.md) — do's/don'ts, section rendering rules, component decisions, project-type adaptation
- [Personalization](references/personalization.md) — user.json fields and behavior
- [Language Support](references/language-support.md) — bilingual output, toggle, language enum, CN translation table, slug convention
