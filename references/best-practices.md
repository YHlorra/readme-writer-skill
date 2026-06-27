# README Best Practices

Distilled from top OSS projects, 2024-2026 standard. Covers both traditional
software projects and modern AI/Agent/LLM projects.

---

## Universal Do's

1. **Lead with what, not how** — first paragraph states what the project does
2. **One-command path to "it works"** — ideal: `npm install && npm start` or `pip install x && x --demo`. Number remaining steps.
3. **Show, don't tell** — screenshots, GIFs, code snippets over prose
4. **Working code examples** — every block is copy-pasteable and runnable
5. **Reference-style links** — keeps body readable with many badges
6. **Adapt to audience** — library ≠ webapp ≠ CLI tool ≠ AI agent framework
7. **Keep it updated** — stale README is worse than no README
8. **Use correct main branch** — use `main`, not `master`, in all examples

---

## Universal Don'ts

1. **Don't paste raw URLs** — use `[text](url)` or reference-style links
2. **Don't use absolute image paths** — use relative (`images/screenshot.png`)
3. **Don't list every dependency** — top 3-5 in "Built With", full list in package files
4. **Don't write a manual** — README is a landing page. Link to docs.
5. **Don't use HTML for everything** — Markdown where possible, HTML only for alignment/layout
6. **Don't forget mobile** — constrain image widths (max 720px for hero images)
7. **Don't leave placeholders unfilled** — fill them or mark `<!-- TODO -->`
8. **Don't duplicate CONTRIBUTING.md** — link to it unless it doesn't exist or is < 100 bytes
9. **Don't skip the license** — unlicensed code is legally ambiguous

---

## AI/Agent Project Do's (v2.0+)

1. **Quick Start above the fold** — users should see working code within one screen of scrolling
2. **State API keys first** — list required API keys BEFORE any `pip install` or `git clone`
3. **Offer multiple entry points** — cloud/Codespaces + one-line install + package manager
4. **List model providers explicitly** — OpenAI, Anthropic, and local (Ollama/vLLM) at minimum
5. **Warn about costs** — one sentence: "This makes API calls; monitor your usage at https://platform.openai.com/usage"
6. **Use GitHub callouts** — `> [!TIP]`, `> [!WARNING]`, `> [!NOTE]`, `> [!CAUTION]` instead of **bold warnings**
7. **Show actual output** — after the code example, show what the user will see
8. **Document MCP/skills/AGENTS.md** — AI coding agent integration is a first-class feature
9. **Include "When (Not) to Use"** — builds trust by setting expectations honestly
10. **Star History always on** — AI projects trend fast; early momentum is motivating
11. **Security section always** — API key exposure warning + non-GitHub vulnerability channel
12. **Contributors Wall for community projects** — `https://contrib.rocks/image?repo=OWNER/REPO`

## AI/Agent Project Don'ts (v2.0+)

1. **Don't bury Quick Start under philosophy** — no "## About" or "## Why" before the user sees code
2. **Don't hide API key requirements** — don't make users install first then discover they need a key
3. **Don't use hype language** — "revolutionary", "state-of-the-art", "best-ever" → describe concrete capabilities
4. **Don't assume OpenAI-only** — always mention alternative providers and local models
5. **Don't use `<details>` TOC** — AI developers scan; plain bullet TOC is faster
6. **Don't overuse back-to-top links** — AI READMEs use visual hierarchy; back-to-top is noise unless >15 sections
7. **Don't forget cost warnings** — surprising users with API bills destroys trust
8. **Don't fabricate plugin/skill URLs** — if no MCP server or skills package exists, add `<!-- TODO -->`

---

## Section Rendering Quick Reference

### Traditional Projects

For full detection rules, see [Template Structure](template-structure.md).

| Section | Render When |
|---------|-------------|
| Configuration | `.env.example` / `config/` / `app.config.*` / `settings.py` / `.envrc` exists |
| Testing | `tests/` / `__tests__` / `vitest.config.*` / `pytest.ini` / `*_test.go` / `package.json` has `test` script |
| Deployment | `Dockerfile` / `docker-compose.yml` / `vercel.json` / `netlify.toml` / `fly.toml` exists |
| Security | `SECURITY.md` exists only |
| Architecture | `docs/architecture.md` / `ARCHITECTURE.md` / `docs/design.md` exists OR monorepo/webapp type |
| FAQ | **Never auto-generate** — manual heading + hint comment only |
| Roadmap | `ROADMAP.md` exists OR `<!-- ENABLE_ROADMAP -->` directive present |

### AI/Agent Projects

For full detection rules, see [AI/Agent README Guide](ai-agent-readme.md).

| Section | Render When |
|---------|-------------|
| Quick Start | **Always** (AI type detected) |
| Breaking Changes Banner | Breaking change in latest version per CHANGELOG |
| Connecting to Models | **Always** (AI type detected) |
| AI Coding Agent Setup | `mcp.json` / `.mcp.json` / `AGENTS.md` / `skills/` exists; else TODO placeholder |
| When (Not) to Use | **Always** (AI type detected) |
| Cloud/Self-Hosted | Dockerfile present OR cloud URL detected OR Helm chart present |
| Telemetry | Code references telemetry/posthog/analytics/mixpanel/segment |
| Security Disclosure | **Always** (AI type detected) |
| Contributors Wall | GitHub contributors > 10 |
| Star History | **Always on** for AI projects (opt-out via `<!-- DISABLE_STAR_HISTORY -->`) |
| Examples/Tutorials | `examples/` directory OR YouTube tutorial link detected |

---

## Component Decision Rules

### All Projects

| Component | Default | Opt-out / Opt-in |
|-----------|---------|------------------|
| Star History | Traditional: on when stars > 50; AI: always on | `<!-- DISABLE_STAR_HISTORY -->` to disable |
| Mermaid | Empty ` ```mermaid ` block + `<!-- TODO -->` placeholder | Only when Architecture section renders |
| Dynamic shields | Auto-detect CI / coverage / downloads | Fallback `<!-- TODO -->` if not detected |
| GitHub Stats card | **Off** | Opt-in only; not auto-generated |

### AI/Agent Projects Only

| Component | Default | Notes |
|-----------|---------|-------|
| GitHub Callouts | Use for warnings/tips | Replaces raw bold text warnings |
| Codespaces button | On when `.devcontainer/` exists | One-click startup |
| One-line install | On when install script detected | curl/sh or powershell/iex |
| Discord badge | On when Discord invite link found | Community is critical for AI projects |
| Downloads badge | **Always on** | PyPI dm / npm dm / Docker pulls |
| Contributors Wall | On when contributors > 10 | contrib.rocks image |
| Plain `<a><img>` wrapping for Star History | Yes — no `<div>` wrapper | Graceful degradation when image service is down |

---

## Badge Hygiene

### Traditional Projects

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

### AI/Agent Projects

| Badge | Condition |
|-------|-----------|
| License | **Always** |
| Version | **Always** (PyPI / npm / GitHub release) |
| Downloads | **Always** (PyPI dm / Docker pulls / npm dm) |
| CI | Auto-detect (`.github/workflows/*`) |
| Discord / Community | Auto-detect (Discord invite link in repo) |
| Stars | **Always on** for AI projects |
| Issues | **Always on** |
| Twitter/X | Auto-detect (Twitter handle in repo) |
| Docs | Auto-detect (docs URL in config) |
| ~~Last Commit~~ | **Removed** for AI — version badge already signals activity |
| ~~Forks~~ | **Removed** — vanity metric |

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
| TOC links don't work | Anchors must match headings exactly |
| Badges point to wrong repo | Double-check `OWNER/REPO` in every shield URL |
| "Fork this repo" in a private project | Remove or replace with internal contribution guide |
| CJK anchor slugs | Use English slugs everywhere: `#configuration`, `#testing` |
| API keys mentioned after install steps | List required keys BEFORE any install commands |
| No model provider alternatives for AI projects | List at least OpenAI, Anthropic, and local |
| Bold text used for warnings | Use `> [!WARNING]` GitHub callout instead |
| `<details>` TOC in AI projects | Use plain bullet list TOC instead |
| Hype language in AI projects ("revolutionary") | Replace with concrete capability descriptions |

---

## GitHub Callout Syntax

Use GitHub-flavored callouts (supported since 2023) instead of bold text or blockquotes for warnings/tips:

```markdown
> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.
```

In AI projects, common uses:
- `> [!WARNING]` for breaking changes, cost warnings, default behavior changes
- `> [!CAUTION]` for API key exposure, security risks, production use warnings
- `> [!TIP]` for model recommendations, performance tips
- `> [!NOTE]` for version differences, community vs enterprise editions

---

## Project Type Quick Reference

### Traditional Projects

| Type | Must-Have Sections |
|------|---------------------|
| **CLI** | About, Install, Usage (with flags/examples), License |
| **Library** | About, Install, Quick Start, API/Usage, License |
| **Webapp** | About, Screenshot/Demo, Getting Started, Environment Setup, License |
| **Monorepo** | About, Architecture overview, Package list, Local dev setup, License |
| **Internal tool** | About, Getting Started, Configuration, Usage, License |

### AI/Agent Projects

| Subtype | Must-Have Sections | Emphasis |
|---------|-------------------|----------|
| **Agent Framework** | Quick Start, Why/Features, Model Config, Agents/Tasks/Tools, Examples, When (Not) to Use, AI Coding Agent Setup | Multi-agent patterns, tool integration, YAML config |
| **Application Platform** | Quick Start (Cloud + Docker), Features with screenshots, Self-Host, Cloud vs Self-Host comparison | UI screenshots, one-command deploy, cloud offering |
| **Coding Agent** | Install (one-liner), Quick Start with code, Harness/Model support, Sandbox/Security, CLI reference | CLI commands, sandboxing, model support matrix |
| **LLM Library/SDK** | Install, Quick Start code, Core Concepts, Integration list, Model providers | Minimal working example first, conceptual explanation after |
| **Model/Inference** | Install, Quick Start, Model Zoo list, Hardware Requirements, Inference examples | Model list, GPU requirements, quantization options |
| **RAG Pipeline** | Quick Start, Data Sources, Embedding Models, Retrieval, Quality notes | Upload → Retrieve → Generate flow, chunking strategies |

For detailed section specs per AI subtype, see [AI/Agent README Guide](ai-agent-readme.md).
