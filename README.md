<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**

[![License][license-shield]][license-url]
[![Version][version-shield]][version-url]
[![Last Commit][last-commit-shield]][last-commit-url]

<br />
<div align="center">
  <h3 align="center">readme-writer</h3>

  <p align="center">
    Production-quality README.md from any codebase — now with AI/Agent project support.
    <br />
    <a href="#usage"><strong>Explore the docs &raquo;</strong></a>
    <br />
    <br />
    <a href="https://github.com/YHlorra/readme-writer-skill/issues/new?labels=bug">Report Bug</a>
    &middot;
    <a href="https://github.com/YHlorra/readme-writer-skill/issues/new?labels=enhancement">Request Feature</a>
  </p>
</div>

<details>
<summary>Table of Contents</summary>

1. [About The Project](#about-the-project)
   - [Built With](#built-with)
   - [What's New in v2.0](#whats-new-in-v20)
2. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
3. [Usage](#usage)
   - [Trigger Phrases](#trigger-phrases)
   - [Template Variants](#template-variants)
4. [How It Works](#how-it-works)
   - [AI/Agent Detection](#aiagent-detection)
   - [Auto-Detected Sections](#auto-detected-sections)
   - [Modern Components](#modern-components)
5. [AI/Agent Project Support](#aiagent-project-support)
   - [New Sections](#new-sections)
   - [AI Project Subtypes](#ai-project-subtypes)
6. [Verification](#verification)
7. [Personalization](#personalization)
8. [Contributing](#contributing)
9. [License](#license)
10. [Contact](#contact)
11. [Acknowledgments](#acknowledgments)

</details>

## About The Project

`readme-writer` is a Claude Skill that turns any codebase into a production-quality `README.md`. It scans your project for identity, tech stack, entry points, and install steps, then assembles a complete README with auto-detected sections and modern components.

Three rules most README generators skip:

- **Read before write** — every fact comes from a real config file, never from guessing.
- **Anti-fabrication** — unknown values stay as `<!-- TODO -->` markers, never invented.
- **Verification** — badge URLs, TOC anchors, reference links, and required sections are checked before delivery.

**Default output is bilingual:** `README.md` (English) + `README.zh-CN.md` (Chinese) with a top-of-file toggle. Override via the `language` input (`both` / `en` / `zh-CN`).

### Built With

- [Markdown](https://commonmark.org/)
- [YAML](https://yaml.org/)
- [Bash](https://www.gnu.org/software/bash/)
- [shields.io](https://shields.io/) — badge generation

### What's New in v2.0

**AI/Agent project support.** The skill now detects AI/LLM/Agent projects automatically and switches to an AI-optimized README template with sections that the AI era demands but traditional templates lack:

- **Quick Start** as a top-level section (not buried under Getting Started)
- **Connecting to Models** — LLM provider configuration (OpenAI, Anthropic, local)
- **AI Coding Agent Setup** — Skills, MCP, AGENTS.md documentation
- **When (Not) to Use** — boundary clarity with ✅/❌ lists
- **GitHub Callouts** — `> [!WARNING]`, `> [!NOTE]`, `> [!TIP]`, `> [!CAUTION]` syntax
- **Security Disclosure** — API key warnings and non-GitHub vulnerability channel
- **Telemetry** — opt-out documentation when detected
- **Contributors Wall** — contrib.rocks image for community projects

Patterns distilled from analyzing top-trending GitHub AI projects: CrewAI, AutoGen, Dify, Open Interpreter, BabyAGI, LangChain, LlamaIndex, AutoGPT, Flowise, and Hugging Face Transformers.

See [AI/Agent Project Support](#aiagent-project-support) below for details.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

This is a **Claude Skill**, not a standalone tool. Install it into Claude Code, OpenCode, or any host that loads skills from `~/.claude/skills/`.

### Prerequisites

- Claude Code, OpenCode, or a compatible host
- Git

### Installation

```sh
git clone https://github.com/YHlorra/readme-writer-skill.git ~/.claude/skills/readme-writer
```

Verify:

```sh
ls ~/.claude/skills/readme-writer/SKILL.md
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

Type one of the [trigger phrases](#trigger-phrases) in any Claude conversation. The skill will:

1. Scan your project root for `package.json`, `requirements.txt`, `go.mod`, etc.
2. Detect language, framework, license, and entry points.
3. Run the [AI/Agent detection heuristic](#aiagent-detection) to classify the project.
4. Auto-detect which sections to render (see [Auto-Detected Sections](#auto-detected-sections)).
5. Assemble a README with modern components (see [Modern Components](#modern-components)).
6. Write `<project_root>/README.md` + `<project_root>/README.zh-CN.md`.

### Trigger Phrases

| Phrase | Language |
|---|---|
| `写readme` / `写README` / `生成readme` | Chinese |
| `帮我写readme` | Chinese |
| `generate readme` / `create readme` | English |

> The trigger set is intentionally narrow. Broader phrases like "project docs" or just "readme" collide with other skills (`write`, `llm-wiki`, `kami`).

### Template Variants

Pass the `template` input to switch shape:

| Variant | Best For |
|---|---|
| `standard` | General-purpose (default) |
| `minimal` | Tiny utilities, scripts |
| `library` | Reusable packages, SDKs |
| `cli` | Command-line tools |
| `webapp` | Frontend / full-stack apps |
| `monorepo` | Multi-package repos |
| `ai-agent` | AI/LLM/Agent projects (auto-detected) |

> The `ai-agent` variant is auto-selected when the [AI/Agent detection heuristic](#aiagent-detection) triggers. You can also force it manually.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## How It Works

The skill runs in four phases:

**Phase 1 — Codebase Analysis.** Reads actual config files (`package.json`, `pyproject.toml`, etc.) using parallel file reads. Never guesses. Also scans for AI signals: LLM dependencies, MCP config, `AGENTS.md`, model config files.

**Phase 2 — Project Type Classification.** Runs the AI/Agent detection heuristic. Also detects: CLI, Library, Webapp, Monorepo, Internal tool.

**Phase 3 — Section Assembly.** Generates each section following the appropriate template:
- **AI/Agent projects:** `references/ai-agent-readme.md` (AI-optimized section order, GitHub callouts, simplified header)
- **Traditional projects:** `references/template-structure.md` (collapsible TOC, centered header, back-to-top links)

**Phase 4 — Verification.** Checks badge URLs, TOC anchors, reference links, required section presence, and Mermaid language hints.

### AI/Agent Detection

Classify as **AI/Agent** type if **any one** is true:

- Dependencies include: `openai`, `langchain`, `crewai`, `autogen`, `llama-index`, `transformers`, `torch`, `anthropic`, `cohere`, `google-generativeai`, `ollama`, `vllm`, `open-interpreter`, `dify`, `mcp`, `semantic-kernel`, `guidance`, `instructor`
- Project mentions: `LLM`, `GPT`, `agent`, `RAG`, `fine-tun`, `embedding`, `vector database`, `prompt engineer`, `MCP`, `AI coding`
- Files named: `agent*.py`, `llm*.py`, `model*.py`, `prompt*.py`, `rag*.py`, `mcp.json`, `.mcp.json`, `AGENTS.md`
- Directories named: `agents/`, `llm/`, `models/`, `prompts/`, `rag/`, `tools/` with agentic patterns

When classified as AI/Agent, the skill uses the AI-optimized section order and rendering rules from [references/ai-agent-readme.md](references/ai-agent-readme.md).

### Auto-Detected Sections

**Traditional projects** — sections render only when detection triggers are met:

| Section | Trigger |
|---|---|
| Configuration | `.env.example` / `config/` / `app.config.*` / `settings.py` / `.envrc` |
| Testing | `tests/` / `__tests__/` / `vitest.config.*` / `pytest.ini` / `*_test.go` / package.json `test` script |
| Deployment | `Dockerfile` / `docker-compose.yml` / `vercel.json` / `netlify.toml` / `fly.toml` |
| Security | `SECURITY.md` exists |
| Architecture | `docs/architecture.md` / `ARCHITECTURE.md` / monorepo/webapp type |
| FAQ | Manual-only (no auto-detection) |
| Roadmap | `ROADMAP.md` exists or `<!-- ENABLE_ROADMAP -->` directive |

**AI/Agent projects** — additional sections:

| Section | Trigger |
|---|---|
| Quick Start | **Always** (AI type detected) |
| Connecting to Models | **Always** (AI type detected) |
| AI Coding Agent Setup | `mcp.json` / `.mcp.json` / `AGENTS.md` / `skills/` exists; else TODO placeholder |
| When (Not) to Use | **Always** (AI type detected) |
| Security Disclosure | **Always** (AI type detected) |
| Telemetry | Code references telemetry/analytics |
| Star History | **Always on** for AI projects |

### Modern Components

| Component | Behavior |
|---|---|
| Star History chart | Traditional: on when stars > 50. AI: **always on**. Opt-out via `<!-- DISABLE_STAR_HISTORY -->` |
| Mermaid diagram | Empty block + TODO when Architecture section renders |
| Dynamic shields | Auto-detect CI / coverage / downloads |
| GitHub Stats card | Opt-in third-party only |
| GitHub Callouts | AI projects: use `> [!NOTE]`, `> [!WARNING]`, `> [!TIP]`, `> [!CAUTION]` instead of bold text |
| Codespaces button | On when `.devcontainer/` exists |
| Contributors Wall | On when contributors > 10 |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## AI/Agent Project Support

v2.0 introduces specialized README patterns for AI, LLM, and Agent projects. These patterns were distilled from analyzing top-trending GitHub AI projects (2024-2026).

### New Sections

| Section | Purpose | Distilled From |
|---|---|---|
| **Quick Start** | Working code within 5 minutes; cloud + one-liner + package manager | Open Interpreter, Dify, CrewAI |
| **Connecting to Models** | LLM provider config (OpenAI, Anthropic, local Ollama/vLLM) | CrewAI, AutoGen |
| **AI Coding Agent Setup** | Skills, MCP, AGENTS.md documentation | CrewAI (Skills/MCP), Open Interpreter |
| **When (Not) to Use** | ✅/❌ boundary clarity | Dify (competitive comparison) |
| **Breaking Changes Banner** | `> [!WARNING]` callout for version migrations | AutoGen |
| **Security Disclosure** | API key warnings, non-GitHub vulnerability channel | Dify |
| **Telemetry** | Anonymous data collection + opt-out | CrewAI |
| **Contributors Wall** | contrib.rocks image for community | AutoGen |

### AI Project Subtypes

The skill recognizes 6 AI project subtypes with tailored section requirements:

| Subtype | Examples | Key Sections |
|---|---|---|
| Agent Framework | CrewAI, AutoGen | Agents, Tasks, Tools, Model Config |
| Application Platform | Dify, Flowise | Cloud vs Self-Host, UI screenshots |
| Coding Agent | Open Interpreter, Codex | One-liner install, Harness, Sandbox |
| LLM Library/SDK | LangChain, LlamaIndex | Quick Start code, Core Concepts |
| Model/Inference | Transformers, vLLM | Model Zoo, Hardware Requirements |
| RAG Pipeline | — | Data Sources, Embedding Models, Retrieval |

Full specification: [references/ai-agent-readme.md](references/ai-agent-readme.md).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Verification

Run the verifier on any README:

```sh
bash scripts/verify_readme.sh path/to/README.md
```

Checks (7 total):

1. shields.io badge count (≥ 3 recommended)
2. Raw placeholder hygiene
3. OWNER placeholder detection
4. TOC orphan anchors
5. Reference-style link closure
6. Required section presence (bilingual: accepts English or Chinese headings)
7. Mermaid language hint warning

Use `--sample` flag for projects that don't trigger all 5 auto-detected sections.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Personalization

Optional `user.json` for recurring fields (`github.username`, default license, acknowledgments, sponsorship). See [references/personalization.md](references/personalization.md).

Location: `~/.claude/skills/readme-writer/user.json`. Skill-internal, never committed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

Contributions are welcome. Fork, create a feature branch, and open a PR.

Before submitting:

1. Run `bash scripts/verify_readme.sh README.md` — must exit 0.
2. Update `references/` if you change the template structure.
3. Add an entry to `CHANGELOG.md`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for the full text.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

Project Link: [https://github.com/YHlorra/readme-writer-skill](https://github.com/YHlorra/readme-writer-skill)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

- [Best-README-Template](https://github.com/othneildrew/Best-README-Template) — the original section structure
- [readme.so](https://readme.so) — section library reference
- [shields.io](https://shields.io/) — badge generation
- [star-history.com](https://star-history.com) — star history charts
- [CrewAI](https://github.com/crewAIInc/crewAI) — AI Coding Agent Setup pattern inspiration
- [AutoGen](https://github.com/microsoft/autogen) — Breaking Changes banner pattern inspiration
- [Dify](https://github.com/langgenius/dify) — Cloud/Self-Host comparison pattern inspiration
- [Open Interpreter](https://github.com/OpenInterpreter/open-interpreter) — Minimal header and one-line install pattern inspiration
- [BabyAGI](https://github.com/yoheinakajima/babyagi) — GitHub Callout syntax inspiration

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- REFERENCE-STYLE LINK DEFINITIONS -->
[license-shield]: https://img.shields.io/github/license/YHlorra/readme-writer-skill.svg?style=for-the-badge
[license-url]: https://github.com/YHlorra/readme-writer-skill/blob/main/LICENSE
[version-shield]: https://img.shields.io/github/v/tag/YHlorra/readme-writer-skill.svg?style=for-the-badge
[version-url]: https://github.com/YHlorra/readme-writer-skill/releases
[last-commit-shield]: https://img.shields.io/github/last-commit/YHlorra/readme-writer-skill.svg?style=for-the-badge
[last-commit-url]: https://github.com/YHlorra/readme-writer-skill/commits/main
