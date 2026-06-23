# README Best Practices

Distilled from analyzing top OSS projects.

## Do

1. **Lead with what, not how** — first paragraph should say what the project does, not how it's built
2. **One-command install** — ideal: `npm install && npm start`. If more steps needed, number them
3. **Show, don't tell** — screenshots, GIFs, and code snippets beat paragraphs
4. **Working code examples** — every code block should be copy-pasteable and runnable
5. **Badges for signal** — stars/forks/issues show community health; license shows compliance
6. **Collapsible TOC** — keeps long READMEs scannable
7. **Back-to-top links** — essential for READMEs over 3 sections
8. **Reference-style links** — keeps the body readable when you have many badges
9. **Adapt to audience** — library READMEs differ from app READMEs differ from CLI tools
10. **Keep it updated** — stale README is worse than no README

## Don't

1. **Don't paste raw URLs** — use `[text](url)` or reference-style links
2. **Don't use absolute image paths** — use relative paths (`images/screenshot.png`) or full GitHub URLs
3. **Don't include every dependency** — list the top 3-5 in "Built With", full list goes in package files
4. **Don't write a manual** — README is a landing page, not documentation. Link to docs
5. **Don't use HTML for everything** — use Markdown where possible, HTML only for alignment/layout
6. **Don't forget mobile** — large images should have width constraints
7. **Don't use `master`** — use `main` as default branch name in examples
8. **Don't leave placeholders** — either fill them or mark with `<!-- TODO -->`
9. **Don't duplicate CONTRIBUTING.md** — if it exists, link to it instead of inlining
10. **Don't skip the license** — unlicensed code is legally ambiguous

## Section Priorities by Project Type

### Library / Package
```
MUST: About, Install, Quick Start, API/Usage, License
NICE: Badges, Contributing, Changelog link
SKIP: Screenshots, Roadmap, Deployment
```

### Web Application
```
MUST: About, Screenshot/Demo, Getting Started, Environment Setup, License
NICE: Badges, Roadmap, Contributing, Deployment
SKIP: API reference (link to separate docs)
```

### CLI Tool
```
MUST: About, Install, Usage (with flags), Examples, License
NICE: Badges, Config file docs, Shell completion
SKIP: Screenshots (unless it has TUI)
```

### Monorepo / Meta-project
```
MUST: About, Architecture overview, Package list, Local dev setup, License
NICE: Badges, Contributing, Decision log
SKIP: Single install command (each package has its own)
```

## Common Mistakes

| Mistake | Fix |
|---|---|
| `npm install` without saying which package manager | Specify: `npm install`, `yarn`, `pnpm install` |
| "See the docs" with no link | Add the actual URL |
| Screenshot is 3MB+ | Compress to <500KB, use WebP |
| TOC links don't work | Check anchors match headings exactly |
| Badges point to wrong repo | Double-check OWNER/REPO in every shield URL |
| "Fork this repo" in a private project | Remove or replace with internal contribution guide |
