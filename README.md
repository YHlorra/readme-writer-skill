<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<br />
<div align="center">
  <h3 align="center">readme-writer-skill</h3>

  <p align="center">
    Production-quality README.md from any codebase.
    <br />
    <a href="#usage"><strong>Explore the docs &raquo;</strong></a>
    <br />
    <br />
    <a href="https://github.com/YHlorra/readme-writer-skill/issues/new?labels=bug">Report Bug</a>
    &middot;
    <a href="https://github.com/YHlorra/readme-writer-skill/issues/new?labels=enhancement">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
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
5. [Roadmap](#roadmap)
6. [Contributing](#contributing)
7. [License](#license)
8. [Contact](#contact)
9. [Acknowledgments](#acknowledgments)

</details>

<!-- ABOUT THE PROJECT -->
## About The Project

`readme-writer` is a Claude Skill that turns any codebase into a production-quality `README.md`. It scans your project for identity, tech stack, entry points, and install steps, then assembles a complete README following the [Best-README-Template](https://github.com/othneildrew/Best-README-Template) pattern.

The skill enforces three rules most README generators skip:

- **Read before write** &mdash; every fact comes from a real config file, never from guessing.
- **Anti-fabrication** &mdash; unknown values stay as `<!-- TODO -->` markers, never invented.
- **Verification** &mdash; badge URLs, TOC anchors, and reference links are checked before delivery.

**Default output is bilingual:** the skill produces `README.md` (English) + `README.zh-CN.md` (Chinese) with a top-of-file toggle. Override via the `language` input (`both` / `en` / `zh-CN`).

### Built With

- [Markdown](https://commonmark.org/)
- [YAML](https://yaml.org/)
- [Bash](https://www.gnu.org/software/bash/)
- [shields.io](https://shields.io/) &mdash; badge generation
- [Best-README-Template](https://github.com/othneildrew/Best-README-Template) &mdash; section structure

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

This is a **Claude Skill**, not a standalone tool. Install it into a Claude Code, OpenCode, or any host that loads skills from `~/.claude/skills/`.

### Prerequisites

- Claude Code, OpenCode, or a compatible host
- Git

### Installation

```sh
git clone https://github.com/YHlorra/readme-writer-skill.git ~/.claude/skills/readme-writer
```

Verify the install:

```sh
ls ~/.claude/skills/readme-writer/SKILL.md
```

The skill is active as soon as `SKILL.md` is on disk.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE -->
## Usage

In any Claude conversation, type one of the [trigger phrases](#trigger-phrases). The skill will:

1. Scan your project root for `package.json`, `requirements.txt`, `go.mod`, etc.
2. Detect language, framework, license, and entry points.
3. Assemble a README following the chosen [template variant](#template-variants).
4. Write the result to `<project_root>/README.md`.

### Trigger Phrases

| Phrase | Language |
|---|---|
| `&#x5199;readme` / `&#x5199;README` / `&#x751F;&#x6210;readme` | Chinese |
| `&#x5E2E;&#x6211;&#x5199;readme` | Chinese |
| `generate readme` / `create readme` | English |

> **Note:** the trigger set is intentionally narrow. Broader phrases like "project docs" or just "readme" were removed because they collide with other skills (`write`, `llm-wiki`, `kami`).

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

Example invocation:

```yaml
inputs:
  project_path: "./my-project"
  template: "library"
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- HOW IT WORKS -->
## How It Works

The skill runs in three phases:

**Phase 1 &mdash; Codebase Analysis.** Reads actual config files (`package.json`, `pyproject.toml`, etc.) using parallel file reads. Never guesses. Outputs a fact sheet.

**Phase 2 &mdash; Section Assembly.** Generates each section following `references/template-structure.md`. Section order is fixed; some sections are skipped when irrelevant (Roadmap for libraries, Acknowledgments when empty).

**Phase 3 &mdash; Verification.** Checks for:

- Badge URLs match the shields.io pattern.
- TOC anchor IDs match heading slugs exactly.
- All reference-style link usages have matching URL definitions.
- No leftover common placeholder strings without `<!-- TODO -->` markers.

You can run the same checks on any README:

```sh
bash scripts/verify_readme.sh path/to/README.md
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [ ] Add `python-library` template variant
- [ ] Support inline screenshots / GIFs auto-detected from `docs/`
- [ ] Interactive mode for ambiguous projects (asks 1-2 clarifying questions)

See the [open issues](https://github.com/YHlorra/readme-writer-skill/issues) for the full backlog.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are welcome. Fork, create a feature branch, and open a PR.

Before submitting:

1. Run `bash scripts/verify_readme.sh README.md` &mdash; must exit 0.
2. Update `references/` if you change the template structure.
3. Add an entry to `CHANGELOG.md`.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for the full text.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Personalization via user.json

The skill reads an optional `user.json` to pre-fill recurring fields:

| Field | Used For |
|---|---|
| `github.username` | Replaces `OWNER` in badge URLs and GitHub links |
| `open_source.default_license` | Pre-fills the License section |
| `open_source.acknowledgments[]` | Auto-inserted into Acknowledgments |
| `sponsorship.*` | Added to Acknowledgments and `FUNDING.yml` |

**Location:** `<skill_install_dir>/user.json`, e.g. `~/.claude/skills/readme-writer/user.json`. Skill-internal &mdash; one file per skill install, shared across every project the skill touches. **Not** per-project.

> `user.json` is local personalization data and is **never committed** when open-sourcing. The skill's own `.gitignore` already excludes it.

The skill ships without a `user.json`. Create one at the install path when you want personalization.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Project Link: [https://github.com/YHlorra/readme-writer-skill](https://github.com/YHlorra/readme-writer-skill)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

- [Best-README-Template](https://github.com/othneildrew/Best-README-Template) &mdash; the section structure this skill encodes
- [shields.io](https://shields.io/) &mdash; badge generation
- [othneildrew](https://github.com/othneildrew) &mdash; original template author

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- REFERENCE-STYLE LINK DEFINITIONS -->
[contributors-shield]: https://img.shields.io/github/contributors/YHlorra/readme-writer-skill.svg?style=for-the-badge
[contributors-url]: https://github.com/YHlorra/readme-writer-skill/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/YHlorra/readme-writer-skill.svg?style=for-the-badge
[forks-url]: https://github.com/YHlorra/readme-writer-skill/network/members
[stars-shield]: https://img.shields.io/github/stars/YHlorra/readme-writer-skill.svg?style=for-the-badge
[stars-url]: https://github.com/YHlorra/readme-writer-skill/stargazers
[issues-shield]: https://img.shields.io/github/issues/YHlorra/readme-writer-skill.svg?style=for-the-badge
[issues-url]: https://github.com/YHlorra/readme-writer-skill/issues
[license-shield]: https://img.shields.io/github/license/YHlorra/readme-writer-skill.svg?style=for-the-badge
[license-url]: https://github.com/YHlorra/readme-writer-skill/blob/main/LICENSE