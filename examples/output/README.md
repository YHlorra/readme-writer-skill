<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**

[![License][license-shield]][license-url]
[![Version][version-shield]][version-url]
[![Last Commit][last-commit-shield]][last-commit-url]

<br />
<div align="center">
  <h3 align="center">hello-counter</h3>

  <p align="center">
    Tiny CLI that counts lines in stdin.
    <br />
    <a href="https://github.com/OWNER/hello-counter"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/OWNER/hello-counter/issues">Report Bug</a>
    ·
    <a href="https://github.com/OWNER/hello-counter/issues">Request Feature</a>
  </p>
</div>

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
    <li><a href="#testing">Testing</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About The Project

`hello-counter` is a minimal Node.js CLI that counts the number of lines piped via stdin. Zero runtime dependencies, runs anywhere Node.js 14 or newer is installed.

Use it for quick sanity checks, log analysis, or as a teaching example for piping in shell scripts.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* [Node.js](https://nodejs.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

* Node.js >= 14

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

## Testing

Run the test suite:

```sh
npm test
```

For a CLI tool, tests verify correct line-counting behavior. Exit code `0` means all tests passed; exit code `1` means one or more tests failed.

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

* `0` — success
* `1` — stdin error or unexpected EOF

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## License

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Contact

Project Link: [https://github.com/OWNER/hello-counter](https://github.com/OWNER/hello-counter)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[license-shield]: https://img.shields.io/github/license/OWNER/hello-counter.svg?style=for-the-badge
[license-url]: https://github.com/OWNER/hello-counter/blob/main/LICENSE
[version-shield]: https://img.shields.io/github/v/tag/OWNER/hello-counter.svg?style=for-the-badge
[version-url]: https://github.com/OWNER/hello-counter/releases
[last-commit-shield]: https://img.shields.io/github/last-commit/OWNER/hello-counter.svg?style=for-the-badge
[last-commit-url]: https://github.com/OWNER/hello-counter/commits/main

<!-- STAR HISTORY — default on when stars > 50. Opt-out: DISABLE_STAR_HISTORY directive -->
<a href="https://star-history.com/#OWNER/hello-counter">
  <img src="https://api.star-history.com/svg?repos=OWNER/hello-counter&type=Date" alt="Star History"/>
</a>
