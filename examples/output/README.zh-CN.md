<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**

[![License][license-shield]][license-url]
[![Version][version-shield]][version-url]
[![Last Commit][last-commit-shield]][last-commit-url]

<br />
<div align="center">
  <h3 align="center">hello-counter</h3>

  <p align="center">
    极简的命令行工具，统计 stdin 输入的行数。
    <br />
    <a href="https://github.com/OWNER/hello-counter"><strong>查看文档 »</strong></a>
    <br />
    <br />
    <a href="https://github.com/OWNER/hello-counter/issues">报告 Bug</a>
    ·
    <a href="https://github.com/OWNER/hello-counter/issues">请求功能</a>
  </p>
</div>

<details>
  <summary>目录</summary>
  <ol>
    <li><a href="#about-the-project">关于本项目</a></li>
    <li><a href="#built-with">技术栈</a></li>
    <li><a href="#getting-started">快速开始</a>
      <ul>
        <li><a href="#prerequisites">前置条件</a></li>
        <li><a href="#installation">安装</a></li>
      </ul>
    </li>
    <li><a href="#testing">测试</a></li>
    <li><a href="#usage">使用方法</a></li>
    <li><a href="#contributing">贡献指南</a></li>
    <li><a href="#license">许可证</a></li>
    <li><a href="#contact">联系方式</a></li>
    <li><a href="#acknowledgments">致谢</a></li>
  </ol>
</details>

## 关于本项目

`hello-counter` 是一个极简的 Node.js 命令行工具，用于统计通过 stdin 传入的行数。零运行时依赖，只要有 Node.js 14 或更高版本即可运行。

适用于快速 sanity check、日志分析，或作为 shell 管道入门的教学示例。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

### 技术栈

* [Node.js](https://nodejs.org/)

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 快速开始

### 前置条件

* Node.js >= 14

### 安装

全局安装：

```sh
npm install -g hello-counter
```

或者不安装直接运行：

```sh
npx hello-counter < input.txt
```

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 测试

运行测试套件：

```sh
npm test
```

CLI 工具的测试用于验证正确的行计数行为。退出码 `0` 表示所有测试通过；退出码 `1` 表示有一个或多个测试失败。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 使用方法

把任意文本通过管道传给命令：

```sh
printf 'line one\nline two\nline three\n' | hello-counter
```

期望输出：

```text
Lines: 3
```

也可以直接喂文件：

```sh
hello-counter < README.md
```

### 退出码

* `0` — 成功
* `1` — stdin 错误或意外的 EOF

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 贡献指南

See [CONTRIBUTING.md](./CONTRIBUTING.md)

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 许可证

Distributed under the MIT License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 联系方式

项目链接：[https://github.com/OWNER/hello-counter](https://github.com/OWNER/hello-counter)

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 致谢

* [Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

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
