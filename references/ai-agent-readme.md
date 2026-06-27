# AI/Agent Project README Guide

Specialized section specification for AI, LLM, and Agent projects.
These patterns are distilled from top-trending GitHub AI projects (2024-2026):
CrewAI, AutoGen, Dify, Open Interpreter, BabyAGI, LangChain, LlamaIndex.

---

## AI Project Detection Heuristic

Classify a project as **AI/Agent** type when **any one** of these is true:

- `requirements.txt` / `pyproject.toml` / `package.json` contains any of:
  `openai`, `langchain`, `crewai`, `autogen`, `llama-index`, `transformers`,
  `torch`, `anthropic`, `cohere`, `google-generativeai`, `ollama`, `vllm`,
  `open-interpreter`, `dify`, `mcp`, `semantic-kernel`, `guidance`, `instructor`
- Project description or README mentions: `LLM`, `GPT`, `agent`, `RAG`,
  `fine-tun`, `embedding`, `vector database`, `prompt engineer`, `MCP`
- Any file named: `agent*.py`, `llm*.py`, `model*.py`, `prompt*.py`, `rag*.py`,
  `mcp.json`, `.mcp.json`, `.mcp/`, `AGENTS.md`
- Directory named: `agents/`, `llm/`, `models/`, `prompts/`, `rag/`, `tools/` with agentic patterns

When classified as AI/Agent type, use the **AI-optimized section order** below
instead of the traditional order. For non-AI projects, continue using the
traditional order in [template-structure.md](template-structure.md).

---

## AI-Optimized Section Order

```
0.  Top Anchor
1.  Language Toggle (if bilingual)
2.  ⚠️ Breaking Changes Banner (conditional)
3.  Project Header (logo, tagline, action links)
4.  Badges
5.  Quick Start ★ (NEW — independent top-level section)
6.  What Is This / About
7.  Why [Project] / Key Differentiators
8.  Table of Contents (simplified, no <details> for AI projects)
9.  Features / Capabilities
10. Installation
11. Connecting to Models / LLM Configuration ★ (NEW)
12. Usage / Getting Started
13. Examples / Tutorials
14. AI Coding Agent Setup ★ (NEW — Skills / MCP / AGENTS.md)
15. Configuration (env vars, config files)
16. Architecture (with Mermaid diagram)
17. When (Not) to Use ★ (NEW — boundary clarity)
18. Cloud / Self-Hosted Options
19. Roadmap
20. Telemetry (conditional)
21. Contributing
22. Security Disclosure
23. License
24. Contact / Community
25. Acknowledgments
26. Star History
27. Contributors Wall (conditional)
28. Reference-Style Link Definitions
```

Sections marked ★ are new or restructured for AI/Agent projects.

---

## New Sections Specification

### Quick Start (NEW — replaces Getting Started as #5)

The #1 most important section for AI projects. Must allow a new user to
see something work in under 5 minutes.

```markdown
## Quick Start

The fastest way to try [Project]:

### Option 1: Cloud (no install needed)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/OWNER/REPO?quickstart=1)

Or try our hosted version: [app.example.com](https://app.example.com) — free credits included.

### Option 2: One-line install

macOS / Linux:
```bash
curl -fsSL https://example.com/install | sh
```

Windows (PowerShell):
```powershell
irm https://example.com/install.ps1 | iex
```

### Option 3: pip / npm (if no one-liner)

```bash
pip install project-name
```

Then run your first task:
```python
import project_name
result = project_name.run("your task here")
print(result)
```
```

**Rules**:
- Always offer multiple options (cloud + local at minimum)
- Include a minimal code example that produces visible output
- If API keys are required, state which ones and link to where to get them
- Do NOT bury Quick Start under Prerequisites — it must be immediately visible
- Codespaces button if devcontainer is present
- One-line install script if the project provides one

---

### Breaking Changes Banner (conditional)

Render when `CHANGELOG.md` mentions breaking changes in the latest version,
or when a `.BREAKING_CHANGES` marker file exists.

```markdown
> [!WARNING]
> **vX.Y.0 Breaking Change**: Default behavior changed. See [migration guide](MIGRATION.md) for details.
```

**Rules**:
- Use GitHub-flavored callout syntax (`> [!WARNING]`, `> [!NOTE]`, `> [!CAUTION]`, `> [!TIP]`)
- Place directly after the header, before any content
- Keep to 1-2 sentences; link to full migration guide
- Remove when the next major version ships

---

### Connecting to Models / LLM Configuration (NEW)

```markdown
## Connecting to Models

[Project] works with any LLM. Configure your provider:

### OpenAI (default)
```bash
export OPENAI_API_KEY=sk-...
```

### Anthropic Claude
```bash
export ANTHROPIC_API_KEY=sk-ant-...
```

### Local models (Ollama, vLLM, llama.cpp)
```bash
export OPENAI_API_BASE=http://localhost:11434/v1
export OPENAI_MODEL_NAME=llama3
```

### Using custom providers

Create a config file or set env vars:
| Variable | Description | Default |
|----------|-------------|---------|
| `LLM_PROVIDER` | Provider name | `openai` |
| `LLM_MODEL` | Model identifier | `gpt-4o` |
| `LLM_TEMPERATURE` | Sampling temperature | `0.7` |
| `LLM_MAX_TOKENS` | Max tokens per response | `4096` |

For advanced routing (fallback models, per-task models), see [docs/models.md](docs/models.md).
```

**Detection triggers** (render when AI/Agent type detected):
- Any LLM-related dependency detected in package files
- `.env.example` contains `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, etc.

**Rules**:
- List at least 3 provider options (OpenAI, Anthropic, local)
- Use a table for configuration variables
- Link to advanced model docs
- Mention if a particular model is recommended as default

---

### AI Coding Agent Setup (NEW)

```markdown
## Use with AI Coding Agents

[Project] includes first-class support for AI coding tools.

### Claude Code
```shell
/plugin marketplace add OWNER/skills
/plugin install projectname-skills
/reload-plugins
```

### Cursor / Codex / Windsurf / Other
```shell
npx skills add OWNER/skills
```

### MCP (Model Context Protocol)
[Project] exposes an MCP server for editor integration:
```json
{
  "mcpServers": {
    "project-name": {
      "command": "npx",
      "args": ["-y", "project-name-mcp"]
    }
  }
}
```

### AGENTS.md
An `AGENTS.md` file is included at the repo root with workflow rules
for AI agents working in this codebase.
```

**Detection triggers** (render when any detected):
- `.mcp.json` or `mcp.json` file present
- `AGENTS.md` file present at repo root
- `skills/` directory or `*.skill.md` files present
- Any MCP server package in dependencies (`@modelcontextprotocol/sdk`, `mcp`, etc.)

**Rules**:
- If none detected but project is AI/Agent type, add a comment placeholder:
  `<!-- TODO: Add AI coding agent setup (skills, MCP, AGENTS.md) -->`
- Mention Claude Code plugin, skills.sh compatibility, and MCP
- Do NOT fabricate plugin/skill URLs — use placeholders if not found

---

### When (Not) to Use (NEW)

```markdown
## When to Use [Project]

**Good for:**
- ✅ Building multi-agent workflows
- ✅ Rapid prototyping of LLM applications
- ✅ Production RAG pipelines
- ✅ Extending via tools/plugins

**Not ideal for:**
- ❌ Simple single-prompt scripts (just use the raw API)
- ❌ On-device inference without a server (use [llama.cpp](https://github.com/ggerganov/llama.cpp))
- ❌ Real-time audio streaming (use [other-project](...))
```

**Rules**:
- Always include for AI/Agent projects — boundary clarity builds trust
- Use ✅/❌ emoji for quick scanning
- Be honest about limitations; link to better alternatives where possible
- 3-5 items per list

---

### Cloud / Self-Hosted Options

```markdown
## Deployment Options

### ☁️ Cloud
[Project Cloud](https://app.example.com) — managed hosting with free tier.
Includes observability, team collaboration, and enterprise SSO.

### 🐳 Docker Self-Host
```bash
docker run -p 8080:8080 -v $(pwd)/data:/data OWNER/project:latest
```

### ☸️ Kubernetes
Helm chart available: [github.com/OWNER/helm-charts](https://github.com/OWNER/helm-charts)

### 🏠 Local (development)
```bash
npm run dev
```
```

**Detection triggers**:
- `Dockerfile` or `docker-compose.yml` present → Docker section
- Helm chart files or `deploy/helm/` present → K8s section
- Cloud URL in package.json or project config → Cloud section

---

### Telemetry (conditional)

Render when: telemetry is explicitly mentioned in code (search for `telemetry`, `posthog`, `analytics`, `mixpanel`, `segment`).

```markdown
## Telemetry

[Project] collects anonymous usage data to help improve the project.
You can opt out by setting:
```bash
export PROJECT_DISABLE_TELEMETRY=1
```

See [PRIVACY.md](PRIVACY.md) for what we collect and why.
```

**Rules**:
- Be transparent about data collection
- Show opt-out mechanism
- Link to privacy policy

---

### Security Disclosure

AI projects handle API keys and user data — a security contact is mandatory.

```markdown
## Security

> [!CAUTION]
> Never commit API keys or `.env` files to version control.

To report a security vulnerability, please email security@example.com
rather than opening a public GitHub issue.

See [SECURITY.md](SECURITY.md) for our disclosure policy.
```

**Rules**:
- Always include for AI/Agent projects
- Warn about API key exposure
- Provide a non-GitHub channel for vulnerability reports
- Link to SECURITY.md if it exists

---

### Contributors Wall (conditional)

Render when GitHub contributors count > 10.

```markdown
## Contributors

<a href="https://github.com/OWNER/REPO/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=OWNER/REPO&max=200" />
</a>
```

---

### Star History

Already documented in [template-structure.md](template-structure.md).
For AI projects: **always on** by default (opt-out with `<!-- DISABLE_STAR_HISTORY -->`),
regardless of star count — AI projects trend fast and early star history is motivating.

---

## AI Project Badge Set

AI projects use a richer badge set than traditional projects.

### Default badges for AI projects (in order):

1. License
2. Version (PyPI / npm / GitHub release)
3. Downloads (PyPI dm / Docker pulls / npm dm)
4. CI status
5. Discord / Community
6. Stars (always on for AI projects)
7. Issues

### Optional:
- Twitter/X follow
- Python/Node version compatibility
- Documentation
- Code coverage
- Docker pulls

### Removed for AI projects:
- ~~Last Commit~~ — noise for fast-moving AI projects; version badge already signals activity
- ~~Forks~~ — vanity metric

---

## AI Project Header (simplified)

Unlike traditional projects which use a rich `<div align="center">` block with logo +
3 action links, AI project headers are more minimal:

```markdown
<h1 align="center">Project Name</h1>

<p align="center">A one-sentence tagline describing what it does.</p>

<p align="center">
 <a href="https://docs.example.com"><img alt="Documentation" src="https://img.shields.io/badge/Docs-latest-blue" /></a>
 <a href="https://discord.gg/xxx"><img alt="Discord" src="https://img.shields.io/discord/xxx" /></a>
 <a href="LICENSE"><img alt="License" src="https://img.shields.io/badge/License-MIT-green" /></a>
</p>

<p align="center">
 <a href="https://docs.example.com">
 <img alt="Demo screenshot" src="docs/demo.png" width="720" />
 </a>
</p>
```

**Rules**:
- Logo optional; if present, keep it small (< 120px)
- Tagline immediately visible — no scroll needed
- 2-4 badges inline
- One hero screenshot/GIF showing the tool in action
- Action links (Docs, Demo, Discord, Cloud) as plain text links below badges
- No `<br />` spam
- No `Explore the docs »` arrow pattern (that's traditional webapp style)

---

## Project Type Variants

| AI Subtype | Must-Have Sections | Emphasis |
|------------|-------------------|----------|
| **Agent Framework** (CrewAI/AutoGen) | Quick Start, Agents, Tools, Model Config, Examples | Multi-agent patterns, tool integration |
| **Application Platform** (Dify/Flowise) | Quick Start (Cloud + Docker), Features, Screenshots, Self-Host | UI screenshots, one-command deploy, cloud vs self-host |
| **Coding Agent** (Open Interpreter/Codex) | Install (one-liner), Usage with code examples, Harness/Model, Sandbox | CLI commands, sandboxing, model support matrix |
| **LLM Library/SDK** (LangChain/LlamaIndex) | Install, Quick Start code, Core Concepts, Integration list | Minimal example first, conceptual explanation after |
| **Model/Inference** (Transformers/vLLM) | Install, Quick Start, Model Zoo, Hardware Requirements | Model list, inference examples, hardware/GPU notes |
| **RAG Pipeline** | Quick Start, Data Sources, Embedding Models, Retrieval quality | Upload → Retrieve → Generate flow, chunking strategies |

---

## Writing Style for AI Projects

1. **Lead with a working example**, not architecture philosophy
2. **Show output** — what does the user see after running the quick start?
3. **State model requirements upfront** — "GPT-4 recommended, GPT-3.5 works with degraded quality"
4. **Warn about costs** — "This will make API calls; monitor your usage"
5. **Use GitHub callouts** for warnings/tips (`> [!TIP]`, `> [!WARNING]`, `> [!NOTE]`)
6. **Avoid hype language** — "state-of-the-art", "revolutionary" → describe concrete capabilities
7. **Document API keys needed BEFORE installation steps**, not after
8. **Show configuration as code** (env vars, YAML, JSON), not as prose paragraphs
9. **Include at least one visual** (screenshot, GIF, or architecture diagram)
10. **Link to docs for depth** — README is a landing page, not the full manual
