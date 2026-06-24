# Template Structure

Full section specification for readme-writer v1.2.0 modern README generation.
Canonical source for section list, detection rules, CN translations, anchor slugs, and modern components.

---

## Cross-Section Conventions

These apply to every section automatically:

- **Back-to-top**: `<p align="right">(<a href="#readme-top">back to top</a>)</p>` at the end of every section.
- **Code blocks**: Always include language hint (` ```sh `, ` ```markdown `, etc.).
- **Reference-style links**: Define all `[ref-name]: url` at the bottom of the file in the Link Definitions section. Every defined link must be used; every used link must be defined.
- **No `<!-- SECTION NAME -->` comment banners** above headings — these are noise.
- **No prose explanations** before code blocks — show the pattern, state the rules.

---

## 0. Language Toggle (Bilingual Default)

Produces a two-file pair: `README.md` (English) and `README.zh-CN.md` (Chinese).

```markdown
<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**
```

### Canonical CN Translation Table

This table is the **single source of truth** for bilingual section titles. Fixers consult this table only — do not use auto-translation.

| English       | 中文        |
|---------------|-------------|
| Configuration | 配置        |
| Testing       | 测试        |
| Deployment    | 部署        |
| Security      | 安全        |
| Architecture  | 架构        |
| FAQ           | 常见问题    |

Section titles above appear in bilingual files. For existing-section translations (About, Getting Started, etc.), use the established translations already in the skill. **Do not re-translate canonical entries above.**

### Anchor Slug Convention

All anchor slugs are **English only**, in both EN and CN files:

`#configuration` / `#testing` / `#deployment` / `#security` / `#architecture` / `#faq`

> **Note**: `examples/output/README.zh-CN.md` currently uses CJK slugs (`#关于本项目` etc.) and must be updated to English slugs in Phase 3b.

---

## 1. Top Anchor

Always first line of every README:

```markdown
<a id="readme-top"></a>
```

---

## 2. Shields / Badges

### Default Three (always render)

```markdown
[![License][license-shield]][license-url]
[![Version][version-shield]][version-url]
[![Last Commit][last-commit-shield]][last-commit-url]
```

### Optional Adds

| Badge | Condition |
|-------|-----------|
| Stars | `user.json` opt-in (`star_count` present) |
| Issues | Default on — GitHub native, no detection needed |
| Contributors | **Monorepo only** (see Monorepo Detection heuristic below) |

### Removed

- **Forks** — noise for internal/personal tools
- **LinkedIn** — not needed for internal/personal tools

### Reference-Style URL Definitions

Reference-style link targets for the 3 default badges. See [Section 19](#19-reference-style-link-definitions) for the full URL list.

Define `OWNER/REPO` at assembly time. Stars/Contributors URLs added only when those badges are rendered.

---

## 3. Project Header

```markdown
<br />
<div align="center">
  <a href="https://github.com/OWNER/REPO">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">PROJECT_TITLE</h3>

  <p align="center">
    PROJECT_DESCRIPTION
    <br />
    <a href="https://github.com/OWNER/REPO"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/OWNER/REPO">View Demo</a>
    ·
    <a href="https://github.com/OWNER/REPO/issues">Report Bug</a>
    ·
    <a href="https://github.com/OWNER/REPO/issues">Request Feature</a>
  </p>
</div>
```

**Rules**:
- Logo: optional. Omit `<a><img>` block if no logo.
- `View Demo`: only if demo exists; remove if not applicable.
- Use `·` (middle dot) as separator.

---

## 4. Table of Contents

```html
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <!-- AUTO-DETECTED SECTIONS BELOW — include only when rendered -->
    <!-- ... Configuration section (if detected) ... -->
    <!-- ... Testing section (if detected) ... -->
    <!-- ... Deployment section (if detected) ... -->
    <!-- ... Security section (if detected) ... -->
    <!-- ... Architecture section (if detected) ... -->
    <!-- ... FAQ section (if rendered manually) ... -->
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>
```

**Rules**:
- Include a ToC entry for every section that is actually rendered.
- Omit sections that do not exist in the final README.
- Anchor format: lowercase, hyphens for spaces, strip special chars.

---

## 5. About The Project

```markdown
## About The Project

[![Product Screenshot][product-screenshot]](https://example.com)

1-2 paragraphs explaining:
- What the project does
- Why it exists (the problem it solves)
- What makes it different

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

### Built With

```markdown
### Built With

* [![React][React.js]][React-url]
* [![Node.js][Node.js]][Node-url]
* [![PostgreSQL][Postgres-shield]][Postgres-url]
```

**Rules**:
- List major frameworks/libraries only. Plugins/addons go in Acknowledgments.
- Use shields.io tech badges (see badge-catalog.md).

---

## 6. Getting Started

```markdown
## Getting Started

1-2 sentences explaining how to get a local copy running.

### Prerequisites

List system requirements with install commands:

* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

Numbered steps:

1. Clone the repo
   ```sh
   git clone https://github.com/OWNER/REPO.git
   ```
2. Install dependencies
   ```sh
   npm install
   ```
3. Configure environment
   ```sh
   cp .env.example .env
   # Edit .env with your values
   ```
4. Run
   ```sh
   npm start
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- Every command in fenced code block with language hint.
- Steps must be actually runnable — no vague "configure your settings" without showing how.
- If API keys needed, show where to get them and where to put them.

---

## 7. Configuration *(auto-detected)*

**Detection triggers** (any one sufficient):
- `.env.example` file present
- `config/` directory present
- `app.config.*` file present
- `settings.py` file present
- `.envrc` file present

```markdown
## Configuration

Describe configuration options. Show the config file or environment variables.

```sh
cp .env.example .env
# Edit .env with your values
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- Point to `.env.example` for template.
- List required environment variables.
- Do not generate this section if no config files detected.

---

## 8. Testing *(auto-detected)*

**Detection triggers** (any one sufficient):
- `tests/` directory present
- `__tests__/` directory present
- `vitest.config.*` file present
- `pytest.ini` file present
- `*_test.go` file present
- `package.json` with `test` script present

```markdown
## Testing

Show how to run tests. Match format to project type (CLI → exit codes/flags; monorepo/webapp → commands).

```sh
npm test
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- CLI tools: emphasize exit codes and flags.
- Monorepo/webapp: show commands for running tests.
- Do not generate this section if no test files/directories detected.

---

## 9. Deployment *(auto-detected)*

**Detection triggers** (any one sufficient):
- `Dockerfile` file present
- `docker-compose.yml` file present
- `vercel.json` file present
- `netlify.toml` file present
- `fly.toml` file present
- `.github/workflows/deploy*` file present

```markdown
## Deployment

Describe deployment steps.

```sh
docker build -t myapp .
docker run -p 8080:8080 myapp
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- Show the actual deployment commands for the detected deployment target.
- Do not generate this section if no deployment files detected.

---

## 10. Security *(auto-detected — conditional render)*

**Render this section ONLY when `SECURITY.md` exists.** No other detection rule.

```markdown
## Security

See [SECURITY.md](SECURITY.md) for disclosure policy.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- **Always** link to `SECURITY.md` if it exists.
- Do not render this section at all if `SECURITY.md` does not exist.
- Do not add a TODO or placeholder — this is community-managed.

---

## 11. Architecture *(auto-detected)*

**Detection triggers** (any one sufficient):
- `docs/architecture.md` file present
- `ARCHITECTURE.md` file present
- `docs/design.md` file present
- **Monorepo project type** detected (see Monorepo Detection heuristic)
- **Webapp project type** detected

```markdown
## Architecture

Describe the high-level architecture. Link to design docs.

```mermaid
<!-- TODO: paste diagram source -->
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- Include Mermaid block only when this section is rendered. The block is intentionally empty — `<!-- TODO: paste diagram source -->` is the only content. No starter template.
- Do not generate this section if no architecture docs detected and project is not monorepo/webapp.

### Monorepo Detection Heuristic

A project is classified as **monorepo** when **any one** of these is true:

- `lerna.json` exists at repo root
- `pnpm-workspace.yaml` exists at repo root
- `turbo.json` exists at repo root
- `nx.json` exists at repo root
- **Multiple** `package.json` files exist at repo root (excluding `node_modules/`

This heuristic is the source of truth for:
- Architecture section auto-detection
- Contributors badge conditional rendering

---

## 12. FAQ *(manual-only — no detection rule)*

This section is community-maintained and is **never auto-generated**.

```markdown
## FAQ

<!-- TODO: Add common questions here -->

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- Render only when explicitly placed in the template or requested by user.
- No detection rule — do not auto-generate based on file presence.
- Heading + hint comment only. No starter Q&A content.

---

## 13. Usage

```markdown
## Usage

Show how to use the project. Screenshots, code examples, CLI demos.

```sh
./myapp --flag value
```

_For more examples, refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- CLI tools: show common commands with flags.
- Web apps: show screenshots with alt text.
- Libraries: show import + basic usage code.

---

## 14. Roadmap *(opt-in)*

**Render this section ONLY when** `ROADMAP.md` **exists** OR `<!-- ENABLE_ROADMAP -->` comment directive is present in the user's README.

```markdown
## Roadmap

- [x] Feature 1
- [x] Feature 2
- [ ] Feature 3
    - [ ] Nested feature

See the [open issues](https://github.com/OWNER/REPO/issues) for a full list.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- Do not render if neither `ROADMAP.md` nor the opt-in directive is present.
- `<!-- ENABLE_ROADMAP -->` is a parallel opt-in mechanism to Star History's `<!-- DISABLE_STAR_HISTORY -->`.

---

## 15. Contributing

**Default**: link to `CONTRIBUTING.md`.

```markdown
## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Inline fallback** (render only when `CONTRIBUTING.md` is missing OR `< 100 bytes`):

```markdown
## Contributing

Contributions are what make the open source community amazing.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- Default to CONTRIBUTING.md link.
- Inline fallback only when CONTRIBUTING.md is absent or trivially small.

---

## 16. License

```markdown
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

**Rules**:
- Check for actual LICENSE file. Name the license if found.
- If no license file exists, use `<!-- TODO: Add license -->`.

---

## 17. Contact

```markdown
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email@example.com

Project Link: [https://github.com/OWNER/REPO](https://github.com/OWNER/REPO)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

---

## 18. Acknowledgments *(optional)*

```markdown
## Acknowledgments

* [Choose an Open Source License](https://choosealicense.com)
* [Shields.io](https://shields.io)
* [GitHub Pages](https://pages.github.com)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

Credit helpful resources, libraries, or people. Skip if none.

---

## 19. Reference-Style Link Definitions

Always at the very bottom. Example:

```markdown
<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/OWNER/REPO.svg?style=for-the-badge
[contributors-url]: https://github.com/OWNER/REPO/graphs/contributors
[stars-shield]: https://img.shields.io/github/stars/OWNER/REPO.svg?style=for-the-badge
[stars-url]: https://github.com/OWNER/REPO/stargazers
[issues-shield]: https://img.shields.io/github/issues/OWNER/REPO.svg?style=for-the-badge
[issues-url]: https://github.com/OWNER/REPO/issues
[license-shield]: https://img.shields.io/github/license/OWNER/REPO.svg?style=for-the-badge
[license-url]: https://github.com/OWNER/REPO/blob/main/LICENSE
[version-shield]: https://img.shields.io/github/v/tag/OWNER/REPO.svg?style=for-the-badge
[version-url]: https://github.com/OWNER/REPO/releases
[last-commit-shield]: https://img.shields.io/github/last-commit/OWNER/REPO.svg?style=for-the-badge
[last-commit-url]: https://github.com/OWNER/REPO/commits/main
[product-screenshot]: images/screenshot.png
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[Node.js]: https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white
[Node-url]: https://nodejs.org/
[Postgres-shield]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
```

**Rules**:
- Replace `OWNER/REPO` with actual GitHub owner and repo name.
- Every `[ref-name]` used above must have a definition here.
- Every definition here must be used above (no orphan definitions).

---

## Appendix: Modern Components Catalog

### Star History

**Default**: on when repository stars > 50.
**Opt-out**: `<!-- DISABLE_STAR_HISTORY -->` comment directive in the user's README.

**Render format** — plain `<a>` + `<img>`, NO `<div>` wrapper:

```markdown
<a href="https://star-history.com/#OWNER/REPO">
  <img src="https://api.star-history.com/svg?repos=OWNER/REPO&type=Date" alt="Star History"/>
</a>
```

**Why plain `<a><img>`**: graceful degradation when image service is down — click-through still works.

### Mermaid Architecture Diagram

**Render**: only when Architecture section (Section 11) is rendered.
**Output**: empty Mermaid block with TODO comment. No starter template.

```markdown
```mermaid
<!-- TODO: paste diagram source -->
```
```

### Dynamic Shields

Auto-detected and rendered when detected:

| Shield | Detection |
|--------|-----------|
| CI | `.github/workflows/*` directory with any workflow files |
| Coverage | `codecov.yml`, `.codecov.yml`, `coveralls.yml`, or `package.json` with `coverage` script |
| Downloads | `package.json` with any registry URL (npm/pip/gem) |

**Fallback**: if not detected, emit `<!-- TODO: add [ci/coverage/downloads] badge -->` as a placeholder comment, not a broken shield image.

### GitHub Stats Card

**NOT default.** Opt-in third-party only. Do not auto-generate.

Reference: https://github-readme-stats.vercel.app

```markdown
[![Stats][stats-shield]][stats-url]
```

Add to badge section only when explicitly requested or `user.json` specifies `github_stats: true`.
