<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**

[![许可证][license-shield]][license-url]
[![版本][version-shield]][version-url]
[![最后提交][last-commit-shield]][last-commit-url]

<br />
<div align="center">
  <h3 align="center">readme-writer</h3>

  <p align="center">
    从任何代码库生成生产级 README.md。默认双语输出。
    <br />
    <a href="#usage"><strong>查看文档 &raquo;</strong></a>
    <br />
    <br />
    <a href="https://github.com/YHlorra/readme-writer-skill/issues/new?labels=bug">报告 Bug</a>
    &middot;
    <a href="https://github.com/YHlorra/readme-writer-skill/issues/new?labels=enhancement">请求功能</a>
  </p>
</div>

<details>
<summary>目录</summary>

1. [关于本项目](#about-the-project)
   - [技术栈](#built-with)
2. [快速开始](#getting-started)
   - [前置条件](#prerequisites)
   - [安装](#installation)
3. [使用方法](#usage)
   - [触发短语](#trigger-phrases)
   - [模板变体](#template-variants)
4. [工作原理](#how-it-works)
   - [自动检测章节](#auto-detected-sections)
   - [现代组件](#modern-components)
5. [验证](#verification)
6. [个性化](#personalization)
7. [贡献指南](#contributing)
8. [许可证](#license)
9. [联系方式](#contact)
10. [致谢](#acknowledgments)

</details>

## 关于本项目

`readme-writer` 是一个 Claude Skill，能将任何代码库转化为生产级 `README.md`。它扫描项目的标识、技术栈、入口点和安装步骤，然后组装一份包含自动检测章节和现代组件的完整 README。

大多数 README 生成器跳过的三条规则：

- **先读后写** — 每个事实来自真实配置文件，绝不猜测。
- **反捏造** — 未知值保持为 `<!-- TODO -->` 标记，绝不编造。
- **验证** — 徽章 URL、目录锚点、引用链接和必需章节在交付前检查。

**默认双语输出：** `README.md`（英文）+ `README.zh-CN.md`（中文），顶部有切换链接。通过 `language` 输入覆盖（`both` / `en` / `zh-CN`）。

### 技术栈

- [Markdown](https://commonmark.org/)
- [YAML](https://yaml.org/)
- [Bash](https://www.gnu.org/software/bash/)
- [shields.io](https://shields.io/) — 徽章生成

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 快速开始

这是一个 **Claude Skill**，不是独立工具。安装到 Claude Code、OpenCode 或任何从 `~/.claude/skills/` 加载 skill 的宿主。

### 前置条件

- Claude Code、OpenCode 或兼容宿主
- Git

### 安装

```sh
git clone https://github.com/YHlorra/readme-writer-skill.git ~/.claude/skills/readme-writer
```

验证：

```sh
ls ~/.claude/skills/readme-writer/SKILL.md
```

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 使用方法

在任何 Claude 对话中输入[触发短语](#trigger-phrases)。Skill 会：

1. 扫描项目根目录的 `package.json`、`requirements.txt`、`go.mod` 等。
2. 检测语言、框架、许可证和入口点。
3. 自动检测要渲染的章节（见[自动检测章节](#auto-detected-sections)）。
4. 组装包含现代组件的 README（见[现代组件](#modern-components)）。
5. 写入 `<project_root>/README.md` + `<project_root>/README.zh-CN.md`。

### 触发短语

| 短语 | 语言 |
|---|---|
| `写readme` / `写README` / `生成readme` | 中文 |
| `帮我写readme` | 中文 |
| `generate readme` / `create readme` | 英文 |

> 触发集故意收窄。更宽泛的短语如"项目文档"或单独的"readme"会与其他 skill（`write`、`llm-wiki`、`kami`）冲突。

### 模板变体

传入 `template` 输入切换形状：

| 变体 | 适用场景 |
|---|---|
| `standard` | 通用（默认） |
| `minimal` | 小工具、脚本 |
| `library` | 可复用包、SDK |
| `cli` | 命令行工具 |
| `webapp` | 前端/全栈应用 |
| `monorepo` | 多包仓库 |

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 工作原理

Skill 分三个阶段运行：

**阶段 1 — 代码库分析。** 读取实际配置文件（`package.json`、`pyproject.toml` 等），使用并行文件读取。绝不猜测。

**阶段 2 — 章节组装。** 按照 `references/template-structure.md` 生成每个章节。自动检测章节仅在检测触发条件满足时渲染。现代组件根据项目元数据添加。

**阶段 3 — 验证。** 检查徽章 URL、目录锚点、引用链接、必需章节存在性和 Mermaid 语言提示。

### 自动检测章节

章节仅在检测触发条件满足时渲染——不过度渲染：

| 章节 | 触发条件 |
|---|---|
| 配置 | `.env.example` / `config/` / `app.config.*` / `settings.py` / `.envrc` |
| 测试 | `tests/` / `__tests__/` / `vitest.config.*` / `pytest.ini` / `*_test.go` / package.json `test` 脚本 |
| 部署 | `Dockerfile` / `docker-compose.yml` / `vercel.json` / `netlify.toml` / `fly.toml` |
| 安全 | `SECURITY.md` 存在 |
| 架构 | `docs/architecture.md` / `ARCHITECTURE.md` / monorepo/webapp 类型 |
| 常见问题 | 仅手动（无自动检测） |
| 路线图 | `ROADMAP.md` 存在或 `<!-- ENABLE_ROADMAP -->` 指令 |

### 现代组件

| 组件 | 行为 |
|---|---|
| Star History 图表 | stars > 50 时默认开启；通过 `<!-- DISABLE_STAR_HISTORY -->` 退出 |
| Mermaid 图表 | 架构章节渲染时给空块 + TODO |
| 动态 shields | 自动检测 CI / coverage / downloads |
| GitHub Stats 卡片 | 仅 opt-in 第三方 |

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 验证

对任何 README 运行验证器：

```sh
bash scripts/verify_readme.sh path/to/README.md
```

检查项（共 7 项）：

1. shields.io 徽章数量（建议 ≥ 3）
2. 原始占位符卫生
3. OWNER 占位符检测
4. 目录孤立锚点
5. 引用式链接闭合
6. 必需章节存在性（双语：接受英文或中文标题）
7. Mermaid 语言提示警告

对未触发所有 5 个自动检测章节的项目使用 `--sample` 标志。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 个性化

可选 `user.json` 用于常用字段（`github.username`、默认许可证、致谢、赞助）。见 [references/personalization.md](references/personalization.md)。

位置：`~/.claude/skills/readme-writer/user.json`。Skill 内部使用，永不提交。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 贡献指南

欢迎贡献。Fork、创建功能分支、提交 PR。

提交前：

1. 运行 `bash scripts/verify_readme.sh README.md` — 必须退出 0。
2. 如果修改了模板结构，更新 `references/`。
3. 在 `CHANGELOG.md` 中添加条目。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 许可证

基于 MIT 许可证分发。详情参见 [`LICENSE`](LICENSE)。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 联系方式

项目链接：[https://github.com/YHlorra/readme-writer-skill](https://github.com/YHlorra/readme-writer-skill)

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 致谢

- [Best-README-Template](https://github.com/othneildrew/Best-README-Template) — 原始章节结构
- [readme.so](https://readme.so) — 章节库参考
- [shields.io](https://shields.io/) — 徽章生成
- [star-history.com](https://star-history.com) — Star History 图表

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

<!-- REFERENCE-STYLE LINK DEFINITIONS -->
[license-shield]: https://img.shields.io/github/license/YHlorra/readme-writer-skill.svg?style=for-the-badge
[license-url]: https://github.com/YHlorra/readme-writer-skill/blob/main/LICENSE
[version-shield]: https://img.shields.io/github/v/tag/YHlorra/readme-writer-skill.svg?style=for-the-badge
[version-url]: https://github.com/YHlorra/readme-writer-skill/releases
[last-commit-shield]: https://img.shields.io/github/last-commit/YHlorra/readme-writer-skill.svg?style=for-the-badge
[last-commit-url]: https://github.com/YHlorra/readme-writer-skill/commits/main
