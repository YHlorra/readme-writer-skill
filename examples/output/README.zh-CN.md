<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**

[![贡献者][contributors-shield]][contributors-url]
[![复刻][forks-shield]][forks-url]
[![星标][stars-shield]][stars-url]
[![问题][issues-shield]][issues-url]
[![MIT 许可证][license-shield]][license-url]

<br />
<div align="center">
  <h3 align="center">hello-counter</h3>

  <p align="center">
    极简的命令行工具，统计 stdin 输入的行数。
    <br />
    <a href="#使用方法"><strong>查看文档 &raquo;</strong></a>
    <br />
    <br />
    <a href="https://github.com/OWNER/hello-counter/issues/new?labels=bug">报告 Bug</a>
    &middot;
    <a href="https://github.com/OWNER/hello-counter/issues/new?labels=enhancement">请求功能</a>
  </p>
</div>

<details>
<summary>目录</summary>

1. [关于本项目](#关于本项目)
   - [技术栈](#技术栈)
2. [快速开始](#快速开始)
   - [前置条件](#前置条件)
   - [安装](#安装)
3. [使用方法](#使用方法)
4. [路线图](#路线图)
5. [贡献指南](#贡献指南)
6. [许可证](#许可证)
7. [联系方式](#联系方式)
8. [致谢](#致谢)

</details>

## 关于本项目

`hello-counter` 是一个极简的 Node.js 命令行工具，用于统计通过 stdin 传入的行数。零运行时依赖，只要有 Node.js 14 或更高版本即可运行。

适用于快速 sanity check、日志分析，或作为 shell 管道入门的教学示例。

### 技术栈

- [Node.js](https://nodejs.org/)
- [JavaScript](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript)

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 快速开始

### 前置条件

- Node.js >= 14

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

- `0` &mdash; 成功
- `1` &mdash; stdin 错误或意外的 EOF

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 路线图

- [ ] 添加 `--words` 参数统计单词数
- [ ] 添加 `--bytes` 参数统计字节数
- [ ] 添加 `--unique` 参数去重

详见 [open issues](https://github.com/OWNER/hello-counter/issues)。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 贡献指南

欢迎 PR。重大变更请先开 issue 讨论。

1. Fork 仓库
2. 创建特性分支（`git checkout -b feat/words`）
3. 提交更改（`git commit -m 'feat: --words flag'`）
4. 推送到分支（`git push origin feat/words`）
5. 发起 Pull Request

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 许可证

本项目使用 MIT 许可证分发。详见 [`LICENSE`](https://github.com/OWNER/hello-counter/blob/main/LICENSE)。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 联系方式

项目链接：[https://github.com/OWNER/hello-counter](https://github.com/OWNER/hello-counter)

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 致谢

- [Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

<!-- 引用式链接定义 -->
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