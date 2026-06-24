<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**

[![License][license-shield]][license-url]
[![Version][version-shield]][version-url]
[![Last Commit][last-commit-shield]][last-commit-url]

<br />
<div align="center">
  <h3 align="center">readme-writer</h3>

  <p align="center">
    Production-quality README.md from any codebase. Bilingual by default.
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
2. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
3. [Usage](#usage)
   - [Trigger Phrases](#trigger-phrases)
   - [Template Variants](#template-variants)
4. [How It Works](#how-it-works)
   - [Auto-Detected Sections](#auto-detected-sections)
   - [Modern Components](#modern-components)
5. [Verification](#verification)
6. [Personalization](#personalization)
7. [Contributing](#contributing)
8. [License](#license)
9. [Contact](#contact)
10. [Acknowledgments](#acknowledgments)

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
3. Auto-detect which sections to render (see [Auto-Detected Sections](#auto-detected-sections)).
4. Assemble a README with modern components (see [Modern Components](#modern-components)).
5. Write `<project_root>/README.md` + `<project_root>/README.zh-CN.md`.

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

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## How It Works

The skill runs in three phases:

**Phase 1 — Codebase Analysis.** Reads actual config files (`package.json`, `pyproject.toml`, etc.) using parallel file reads. Never guesses.

**Phase 2 — Section Assembly.** Generates each section following `references/template-structure.md`. Auto-detected sections render only when their detection triggers are met. Modern components are added based on project metadata.

**Phase 3 — Verification.** Checks badge URLs, TOC anchors, reference links, required section presence, and Mermaid language hints.

### Auto-Detected Sections

Sections render only when detection triggers are met — no over-rendering:

| Section | Trigger |
|---|---|
| Configuration | `.env.example` / `config/` / `app.config.*` / `settings.py` / `.envrc` |
| Testing | `tests/` / `__tests__/` / `vitest.config.*` / `pytest.ini` / `*_test.go` / package.json `test` script |
| Deployment | `Dockerfile` / `docker-compose.yml` / `vercel.json` / `netlify.toml` / `fly.toml` |
| Security | `SECURITY.md` exists |
| Architecture | `docs/architecture.md` / `ARCHITECTURE.md` / monorepo/webapp type |
| FAQ | Manual-only (no auto-detection) |
| Roadmap | `ROADMAP.md` exists or `<!-- ENABLE_ROADMAP -->` directive |

### Modern Components

| Component | Behavior |
|---|---|
| Star History chart | Default on when stars > 50; opt-out via `<!-- DISABLE_STAR_HISTORY -->` |
| Mermaid diagram | Empty block + TODO when Architecture section renders |
| Dynamic shields | Auto-detect CI / coverage / downloads |
| GitHub Stats card | Opt-in third-party only |

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

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- REFERENCE-STYLE LINK DEFINITIONS -->
[license-shield]: https://img.shields.io/github/license/YHlorra/readme-writer-skill.svg?style=for-the-badge
[license-url]: https://github.com/YHlorra/readme-writer-skill/blob/main/LICENSE
[version-shield]: https://img.shields.io/github/v/tag/YHlorra/readme-writer-skill.svg?style=for-the-badge
[version-url]: https://github.com/YHlorra/readme-writer-skill/releases
[last-commit-shield]: https://img.shields.io/github/last-commit/YHlorra/readme-writer-skill.svg?style=for-the-badge
[last-commit-url]: https://github.com/YHlorra/readme-writer-skill/commits/main
