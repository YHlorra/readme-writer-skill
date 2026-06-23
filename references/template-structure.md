# Template Structure

Full section specification with exact HTML/Markdown patterns.

Source: [Best-README-Template](https://github.com/othneildrew/Best-README-Template)

---

## 0. Language Toggle (Bilingual Default)

The skill produces a two-file pair by default: `README.md` (English) and `README.zh-CN.md` (Chinese). Both files cross-link via a top-of-file toggle, inserted immediately after the top anchor:

```markdown
<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**
```

When single-language output is requested (`language: "en"` or `language: "zh-CN"`), omit the toggle line.

The two files have identical section structure. Section titles in the Chinese version are translated:

| English | Chinese |
|---|---|
| About The Project | 关于本项目 |
| Getting Started | 快速开始 |
| Usage | 使用方法 |
| Roadmap | 路线图 |
| Contributing | 贡献指南 |
| License | 许可证 |
| Contact | 联系方式 |
| Acknowledgments | 致谢 |

Anchor slugs in the Chinese version follow the English convention (e.g., `#about-the-project`, `#getting-started`) so that any shared links from the English version still resolve.

---

## 1. Top Anchor

```html
<a id="readme-top"></a>
```

Always first line. Enables back-to-top links.

## 2. Shields / Badges

Use reference-style links for readability:

```markdown
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
```

Define the actual URLs at the bottom of the file (see section 12).

## 3. Project Header

```html
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

Rules:
- Logo is optional. If no logo, skip the `<a><img>` block.
- `View Demo` link only if a demo exists. Remove if not applicable.
- Use `·` (middle dot) as separator between action links.

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
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>
```

Rules:
- Omit sections that don't exist in the final README.
- Anchor format: lowercase, hyphens for spaces, strip special chars.

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

Rules:
- List major frameworks/libraries only. Put plugins/addons in Acknowledgments.
- Use shields.io tech badges (see badge-catalog.md).

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

Rules:
- Every command must be in a fenced code block with language hint.
- Steps must be actually runnable — no vague "configure your settings" without showing how.
- If the project needs API keys, show where to get them and where to put them.

## 7. Usage

```markdown
## Usage

Show how to use the project. Screenshots, code examples, CLI demos.

```sh
./myapp --flag value
```

_For more examples, refer to the [Documentation](https://example.com)_

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

Rules:
- CLI tools: show common commands with flags.
- Web apps: show screenshots with alt text.
- Libraries: show import + basic usage code.

## 8. Roadmap (Optional)

```markdown
## Roadmap

- [x] Feature 1
- [x] Feature 2
- [ ] Feature 3
    - [ ] Nested feature

See the [open issues](https://github.com/OWNER/REPO/issues) for a full list.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

Skip this section if no milestones or roadmap exists.

## 9. Contributing

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

For internal/private projects, replace with team-specific contribution guidelines or remove.

## 10. License

```markdown
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

Rules:
- Check for actual LICENSE file. If found, name the license.
- If no license file exists, use `<!-- TODO: Add license -->`.

## 11. Contact

```markdown
## Contact

Your Name - [@twitter_handle](https://twitter.com/twitter_handle) - email@example.com

Project Link: [https://github.com/OWNER/REPO](https://github.com/OWNER/REPO)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

## 12. Acknowledgments (Optional)

```markdown
## Acknowledgments

* [Choose an Open Source License](https://choosealicense.com)
* [Shields.io](https://shields.io)
* [GitHub Pages](https://pages.github.com)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
```

Credit helpful resources, libraries, or people. Skip if none.

## 13. Reference-Style Link Definitions

Always at the very bottom. Example:

```markdown
<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/OWNER/REPO.svg?style=for-the-badge
[contributors-url]: https://github.com/OWNER/REPO/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/OWNER/REPO.svg?style=for-the-badge
[forks-url]: https://github.com/OWNER/REPO/network/members
[stars-shield]: https://img.shields.io/github/stars/OWNER/REPO.svg?style=for-the-badge
[stars-url]: https://github.com/OWNER/REPO/stargazers
[issues-shield]: https://img.shields.io/github/issues/OWNER/REPO.svg?style=for-the-badge
[issues-url]: https://github.com/OWNER/REPO/issues
[license-shield]: https://img.shields.io/github/license/OWNER/REPO.svg?style=for-the-badge
[license-url]: https://github.com/OWNER/REPO/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/LINKEDIN_USERNAME
[product-screenshot]: images/screenshot.png
```

Rules:
- Replace `OWNER/REPO` with actual GitHub owner and repo name.
- Every `[ref-name]` used above must have a definition here.
- Every definition here must be used above (no orphan definitions).
