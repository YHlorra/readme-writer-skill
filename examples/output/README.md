<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<br />
<div align="center">
  <h3 align="center">hello-counter</h3>

  <p align="center">
    Tiny CLI that counts lines in stdin.
    <br />
    <a href="#usage"><strong>Explore the docs &raquo;</strong></a>
    <br />
    <br />
    <a href="https://github.com/OWNER/hello-counter/issues/new?labels=bug">Report Bug</a>
    &middot;
    <a href="https://github.com/OWNER/hello-counter/issues/new?labels=enhancement">Request Feature</a>
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
4. [Roadmap](#roadmap)
5. [Contributing](#contributing)
6. [License](#license)
7. [Contact](#contact)
8. [Acknowledgments](#acknowledgments)

</details>

## About The Project

`hello-counter` is a minimal Node.js CLI that counts the number of lines piped via stdin. Zero runtime dependencies, runs anywhere Node.js 14 or newer is installed.

Use it for quick sanity checks, log analysis, or as a teaching example for piping in shell scripts.

### Built With

- [Node.js](https://nodejs.org/)
- [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

- Node.js >= 14

### Installation

Install globally:

```sh
npm install -g hello-counter
```

Or run without installing:

```sh
npx hello-counter < input.txt
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

Pipe any text into the command:

```sh
printf 'line one\nline two\nline three\n' | hello-counter
```

Expected output:

```text
Lines: 3
```

You can also feed it a file:

```sh
hello-counter < README.md
```

### Exit codes

- `0` &mdash; success
- `1` &mdash; stdin error or unexpected EOF

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Roadmap

- [ ] Add `--words` flag for word counting
- [ ] Add `--bytes` flag for byte counting
- [ ] Add `--unique` flag for deduplication

See the [open issues](https://github.com/OWNER/hello-counter/issues) for the full backlog.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

PRs welcome. Open an issue first to discuss major changes.

1. Fork the repo
2. Create your feature branch (`git checkout -b feat/words`)
3. Commit your changes (`git commit -m 'feat: --words flag'`)
4. Push to the branch (`git push origin feat/words`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the MIT License. See [`LICENSE`](https://github.com/OWNER/hello-counter/blob/main/LICENSE) for the full text.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

Project Link: [https://github.com/OWNER/hello-counter](https://github.com/OWNER/hello-counter)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

- [Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- REFERENCE-STYLE LINK DEFINITIONS -->
[contributors-shield]: https://img.shields.io/github/contributors/OWNER/hello-counter.svg?style=for-the-badge
[contributors-url]: https://github.com/OWNER/hello-counter/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/OWNER/hello-counter.svg?style=for-the-badge
[forks-url]: https://github.com/OWNER/hello-counter/network/members
[stars-shield]: https://img.shields.io/github/stars/OWNER/hello-counter.svg?style=for-the-badge
[stars-url]: https://github.com/OWNER/hello-counter/stargazers
[issues-shield]: https://img.shields.io/github/issues/OWNER/hello-counter.svg?style=for-the-badge
[issues-url]: https://github.com/OWNER/hello-counter/issues
[license-shield]: https://img.shields.io/github/license/OWNER/hello-counter.svg?style=for-the-badge
[license-url]: https://github.com/OWNER/hello-counter/blob/main/LICENSE