---
name: readme-writer
version: 2.0.0
license: MIT
description: >
  Generate production-quality README.md for any project — with specialized
  support for AI/Agent/LLM projects. Analyzes codebase, tech stack, and structure
  to produce modern, agent-friendly READMEs.
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
  - ai
  - agent
  - llm
exclusions:
  - "不润色现有文案 → write"
  - "不做知识库 wiki → llm-wiki"
  - "不做 token-based 设计落地页 → kami"
  - "不做 API 参考文档"
---

# README Writer

Generate a complete, production-quality `README.md` for any project,
with specialized templates and patterns for AI/Agent/LLM projects.

## Workflow

### Phase 1: Codebase Analysis

Before writing, gather these facts from the project:

1. **Identity**: project name, description, author, license
2. **Tech stack**: languages, frameworks, libraries (check package.json, requirements.txt, pyproject.toml, go.mod, Cargo.toml, pom.xml, etc.)
3. **Project type classification**: Run the AI/Agent detection heuristic (see below). Also detect: CLI, Library, Webapp, Monorepo, Internal tool.
4. **Entry points**: main files, CLI commands, API routes, agent entrypoints
5. **Install & run**: how to set up locally (dependencies, env vars, build steps, API keys needed)
6. **LLM/AI signals**: check for `.env.example` API keys, model config files, MCP config (`mcp.json`, `.mcp.json`, `.mcp/`), `AGENTS.md`, skills directories
7. **Deployment signals**: Dockerfile, docker-compose, Helm charts, cloud URLs, one-line install scripts
8. **Community signals**: Discord link, Twitter/X, CONTRIBUTING.md, SECURITY.md, CHANGELOG.md, telemetry references
9. **Project structure**: key directories and their purpose
10. **Existing docs**: any README, CONTRIBUTING, LICENSE, AGENTS.md, SECURITY.md already present

Use `ctx_batch_execute` or direct file reads. Do NOT guess — read actual config files.

#### AI/Agent Detection Heuristic

Classify as **AI/Agent** type if **any one** is true:

- Dependencies include: `openai`, `langchain`, `crewai`, `autogen`, `llama-index`,
  `transformers`, `torch`, `anthropic`, `cohere`, `google-generativeai`, `ollama`,
  `vllm`, `open-interpreter`, `dify`, `mcp`, `semantic-kernel`, `guidance`, `instructor`
- Project mentions: `LLM`, `GPT`, `agent`, `RAG`, `fine-tun`, `embedding`,
  `vector database`, `prompt engineer`, `MCP`, `AI coding`
- Files named: `agent*.py`, `llm*.py`, `model*.py`, `prompt*.py`, `rag*.py`,
  `mcp.json`, `.mcp.json`, `AGENTS.md`
- Directories named: `agents/`, `llm/`, `models/`, `prompts/`, `rag/`, `tools/` with agentic patterns

When classified as AI/Agent, use the **AI-optimized** workflow and section order
from [references/ai-agent-readme.md](references/ai-agent-readme.md).

For non-AI projects, use the **traditional** workflow in [references/template-structure.md](references/template-structure.md).

### Phase 2: Section Assembly

**If AI/Agent project type:**
- Follow section order and rendering rules in [references/ai-agent-readme.md](references/ai-agent-readme.md)
- Include AI-specific sections: Quick Start, Connecting to Models, AI Coding Agent Setup, When (Not) to Use
- Use AI-optimized badge set and simplified header
- Use GitHub callout syntax (`> [!NOTE]`, `> [!WARNING]`, `> [!CAUTION]`, `> [!TIP]`)
- Star History is on by default (no star count threshold)

**If traditional project type:**
- Follow section order and rendering rules in [references/template-structure.md](references/template-structure.md)
- Use collapsible `<details>` TOC, centered `<div>` header, traditional badge set
- Back-to-top links after every major section

For both types, consult [references/best-practices.md](references/best-practices.md)
for do's/don'ts and [references/badge-catalog.md](references/badge-catalog.md) for shield patterns.

### Phase 3: Bilingual Output (Default)

Produce two files by default:
- `README.md` (English)
- `README.zh-CN.md` (Chinese)

Follow translation table and anchor slug rules in [references/language-support.md](references/language-support.md).
All anchor slugs are English-only in both files.

If the project is Chinese-only or the user explicitly requests single-language output, skip the bilingual pair.

### Phase 4: Output

Write the README file(s) to the project root. Return the file path(s).

## Rules

### Universal Rules (both project types)

1. **Never fabricate** — if you can't determine a fact (license, author, install steps, model providers), use a placeholder with `<!-- TODO: ... -->` comment
2. **Reference-style badges** — define all badge URLs at the bottom of the file
3. **Code blocks** with language hints for all commands and code
4. **Adapt sections** — skip optional sections when their detection triggers are not met; always include core sections for the detected project type
5. **Anchor hygiene** — TOC anchors must match section headings exactly

### Traditional Project Rules

1. **Back-to-top links** after every major section: `<p align="right">(<a href="#readme-top">back to top</a>)</p>`
2. **Collapsible TOC** using `<details><summary>Table of Contents</summary>...</details>`
3. **Centered header** using `<div align="center">` with logo, title, description, and action links
4. **Default badges**: License + Version + Last Commit (3). Optional: Stars (user.json opt-in), Issues (default on), Contributors (monorepo only).

### AI/Agent Project Rules

1. **Quick Start is the #1 section** — it comes before About/Features and must be immediately visible (no scrolling past long descriptions)
2. **State API key requirements BEFORE installation steps**, not after
3. **Model configuration is a top-level section** — not buried in Configuration
4. **Include "When (Not) to Use"** — boundary clarity builds trust in AI projects
5. **Security section is mandatory** — warn about API key exposure; provide non-GitHub vulnerability channel
6. **Use GitHub callouts** (`> [!NOTE]`, `> [!WARNING]`, `> [!CAUTION]`, `> [!TIP]`) for warnings and tips instead of bold text
7. **Simplified TOC** — use a plain bullet list, NOT `<details>` collapsible (AI developers scan fast)
8. **Simplified header** — use `<h1 align="center">` + tagline + badges; no `<br />` spam
9. **Star History always on** — AI projects trend fast; early star history is motivating
10. **Badge set for AI**: License + Version + Downloads + CI + Discord/Community + Stars + Issues
11. **AI Coding Agent Setup section** — if MCP, AGENTS.md, or skills are detected, document them; if not, add `<!-- TODO -->` placeholder
12. **No back-to-top links required** — AI READMEs tend to be shorter with better visual hierarchy; skip unless README exceeds 15 sections

## Quality Checklist

Before delivering, verify:

**All projects:**
- [ ] Every `<img>` or badge URL references a real endpoint or uses shields.io pattern
- [ ] Installation/quick-start steps are actually runnable (not copy-paste from template)
- [ ] TOC anchors match section headings exactly
- [ ] Reference-style links at bottom match all `[text][ref]` usages above
- [ ] No leftover placeholder text without `<!-- TODO -->` markers
- [ ] Code blocks have correct language hints

**AI/Agent projects additionally:**
- [ ] Quick Start shows a working example that produces visible output in under 5 minutes
- [ ] API keys required are listed before installation commands
- [ ] At least one visual (screenshot, GIF, or Mermaid diagram) is included or TODO'd
- [ ] "When (Not) to Use" section is present with ✅/❌ items
- [ ] Security section present with API key warning
- [ ] Model providers listed (OpenAI, Anthropic, local at minimum)
- [ ] No hype language ("revolutionary", "state-of-the-art") — replaced with concrete descriptions
- [ ] GitHub callouts used for warnings/tips instead of raw bold text
- [ ] No `<details>` collapsible TOC
- [ ] Star History section included

## Reference Map

- [AI/Agent README Guide](references/ai-agent-readme.md) — AI/Agent detection heuristic, AI-optimized section order, new sections spec, AI badge set, writing style
- [Template Structure](references/template-structure.md) — traditional section spec, detection triggers, CN translation table, modern components
- [Badge Catalog](references/badge-catalog.md) — shields.io badge patterns
- [Best Practices](references/best-practices.md) — do's/don'ts, section rendering rules, component decisions, project-type adaptation
- [Personalization](references/personalization.md) — user.json fields and behavior
- [Language Support](references/language-support.md) — bilingual output, toggle, language enum, CN translation table, slug convention
