<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**

[![许可证][license-shield]][license-url]
[![版本][version-shield]][version-url]
[![最后提交][last-commit-shield]][last-commit-url]

<br />
<div align="center">
  <h3 align="center">readme-writer</h3>

  <p align="center">
    从任何代码库生成生产级 README.md — 现已支持 AI/Agent 项目。
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
   - [v2.0 新特性](#whats-new-in-v20)
2. [快速开始](#getting-started)
   - [前置条件](#prerequisites)
   - [安装](#installation)
3. [使用方法](#usage)
   - [触发短语](#trigger-phrases)
   - [模板变体](#template-variants)
4. [工作原理](#how-it-works)
   - [AI/Agent 检测](#aiagent-detection)
   - [自动检测章节](#auto-detected-sections)
   - [现代组件](#modern-components)
5. [AI/Agent 项目支持](#aiagent-project-support)
   - [新增章节](#new-sections)
   - [AI 项目子类型](#ai-project-subtypes)
6. [验证](#verification)
7. [个性化](#personalization)
8. [贡献指南](#contributing)
9. [许可证](#license)
10. [联系方式](#contact)
11. [致谢](#acknowledgments)

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

### v2.0 新特性

**AI/Agent 项目支持。** Skill 现在能自动检测 AI/LLM/Agent 项目，并切换到 AI 优化的 README 模板，包含 AI 时代必需但传统模板缺失的章节：

- **Quick Start** 作为顶级章节（不再埋在 Getting Started 下面）
- **Connecting to Models** — LLM 供应商配置（OpenAI、Anthropic、本地模型）
- **AI Coding Agent Setup** — Skills、MCP、AGENTS.md 文档
- **When (Not) to Use** — ✅/❌ 清单明确边界
- **GitHub Callouts** — `> [!WARNING]`、`> [!NOTE]`、`> [!TIP]`、`> [!CAUTION]` 语法
- **Security Disclosure** — API key 警告和非 GitHub 漏洞报告渠道
- **Telemetry** — 检测到时提供 opt-out 文档
- **Contributors Wall** — 社区项目的 contrib.rocks 图片

模式蒸馏自分析 GitHub 热门 AI 项目：CrewAI、AutoGen、Dify、Open Interpreter、BabyAGI、LangChain、LlamaIndex、AutoGPT、Flowise、Hugging Face Transformers。

详见下方 [AI/Agent 项目支持](#aiagent-project-support)。

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
3. 运行 [AI/Agent 检测启发式](#aiagent-detection) 对项目分类。
4. 自动检测要渲染的章节（见[自动检测章节](#auto-detected-sections)）。
5. 组装包含现代组件的 README（见[现代组件](#modern-components)）。
6. 写入 `<project_root>/README.md` + `<project_root>/README.zh-CN.md`。

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
| `ai-agent` | AI/LLM/Agent 项目（自动检测） |

> `ai-agent` 变体在 [AI/Agent 检测启发式](#aiagent-detection) 触发时自动选择，也可手动强制指定。

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## 工作原理

Skill 分四个阶段运行：

**阶段 1 — 代码库分析。** 读取实际配置文件（`package.json`、`pyproject.toml` 等），使用并行文件读取。绝不猜测。同时扫描 AI 信号：LLM 依赖、MCP 配置、`AGENTS.md`、模型配置文件。

**阶段 2 — 项目类型分类。** 运行 AI/Agent 检测启发式。同时检测：CLI、Library、Webapp、Monorepo、Internal tool。

**阶段 3 — 章节组装。** 按照对应模板生成每个章节：
- **AI/Agent 项目：** `references/ai-agent-readme.md`（AI 优化章节顺序、GitHub callouts、简化头部）
- **传统项目：** `references/template-structure.md`（折叠 TOC、居中头部、回到顶部链接）

**阶段 4 — 验证。** 检查徽章 URL、目录锚点、引用链接、必需章节存在性和 Mermaid 语言提示。

### AI/Agent 检测

当以下**任一**条件为真时，分类为 **AI/Agent** 类型：

- 依赖包含：`openai`、`langchain`、`crewai`、`autogen`、`llama-index`、`transformers`、`torch`、`anthropic`、`cohere`、`google-generativeai`、`ollama`、`vllm`、`open-interpreter`、`dify`、`mcp`、`semantic-kernel`、`guidance`、`instructor`
- 项目描述提及：`LLM`、`GPT`、`agent`、`RAG`、`fine-tun`、`embedding`、`vector database`、`prompt engineer`、`MCP`、`AI coding`
- 文件名：`agent*.py`、`llm*.py`、`model*.py`、`prompt*.py`、`rag*.py`、`mcp.json`、`.mcp.json`、`AGENTS.md`
- 目录名：`agents/`、`llm/`、`models/`、`prompts/`、`rag/`、`tools/`（含 agentic 模式）

分类为 AI/Agent 时，Skill 使用 `references/ai-agent-readme.md` 中的 AI 优化章节顺序和渲染规则。

### 自动检测章节

**传统项目** — 章节仅在检测触发条件满足时渲染：

| 章节 | 触发条件 |
|---|---|
| 配置 | `.env.example` / `config/` / `app.config.*` / `settings.py` / `.envrc` |
| 测试 | `tests/` / `__tests__/` / `vitest.config.*` / `pytest.ini` / `*_test.go` / package.json `test` 脚本 |
| 部署 | `Dockerfile` / `docker-compose.yml` / `vercel.json` / `netlify.toml` / `fly.toml` |
| 安全 | `SECURITY.md` 存在 |
| 架构 | `docs/architecture.md` / `ARCHITECTURE.md` / monorepo/webapp 类型 |
| 常见问题 | 仅手动（无自动检测） |
| 路线图 | `ROADMAP.md` 存在或 `<!-- ENABLE_ROADMAP -->` 指令 |

**AI/Agent 项目** — 额外章节：

| 章节 | 触发条件 |
|---|---|
| Quick Start | **总是渲染**（检测到 AI 类型） |
| Connecting to Models | **总是渲染**（检测到 AI 类型） |
| AI Coding Agent Setup | `mcp.json` / `.mcp.json` / `AGENTS.md` / `skills/` 存在；否则 TODO 占位符 |
| When (Not) to Use | **总是渲染**（检测到 AI 类型） |
| Security Disclosure | **总是渲染**（检测到 AI 类型） |
| Telemetry | 代码引用 telemetry/analytics |
| Star History | **AI 项目总是开启** |

### 现代组件

| 组件 | 行为 |
|---|---|
| Star History 图表 | 传统：stars > 50 时开启。AI：**总是开启**。通过 `<!-- DISABLE_STAR_HISTORY -->` 退出 |
| Mermaid 图表 | 架构章节渲染时给空块 + TODO |
| 动态 shields | 自动检测 CI / coverage / downloads |
| GitHub Stats 卡片 | 仅 opt-in 第三方 |
| GitHub Callouts | AI 项目：使用 `> [!NOTE]`、`> [!WARNING]`、`> [!TIP]`、`> [!CAUTION]` 代替粗体文本 |
| Codespaces 按钮 | `.devcontainer/` 存在时开启 |
| Contributors Wall | 贡献者 > 10 时开启 |

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

## AI/Agent 项目支持

v2.0 引入了针对 AI、LLM 和 Agent 项目的专门 README 模式。这些模式蒸馏自分析 2024-2026 年 GitHub 热门 AI 项目。

### 新增章节

| 章节 | 用途 | 蒸馏来源 |
|---|---|---|
| **Quick Start** | 5 分钟内可运行代码；云端 + 一键安装 + 包管理器 | Open Interpreter、Dify、CrewAI |
| **Connecting to Models** | LLM 供应商配置（OpenAI、Anthropic、本地 Ollama/vLLM） | CrewAI、AutoGen |
| **AI Coding Agent Setup** | Skills、MCP、AGENTS.md 文档 | CrewAI (Skills/MCP)、Open Interpreter |
| **When (Not) to Use** | ✅/❌ 边界清晰度 | Dify（竞品对比） |
| **Breaking Changes Banner** | `> [!WARNING]` callout 用于版本迁移 | AutoGen |
| **Security Disclosure** | API key 警告、非 GitHub 漏洞报告渠道 | Dify |
| **Telemetry** | 匿名数据收集 + opt-out | CrewAI |
| **Contributors Wall** | 社区 contrib.rocks 图片 | AutoGen |

### AI 项目子类型

Skill 识别 6 种 AI 项目子类型，各有定制章节要求：

| 子类型 | 示例 | 关键章节 |
|---|---|---|
| Agent Framework | CrewAI、AutoGen | Agents、Tasks、Tools、Model Config |
| Application Platform | Dify、Flowise | Cloud vs Self-Host、UI 截图 |
| Coding Agent | Open Interpreter、Codex | 一键安装、Harness、Sandbox |
| LLM Library/SDK | LangChain、LlamaIndex | Quick Start 代码、Core Concepts |
| Model/Inference | Transformers、vLLM | Model Zoo、Hardware Requirements |
| RAG Pipeline | — | Data Sources、Embedding Models、Retrieval |

完整规范：[references/ai-agent-readme.md](references/ai-agent-readme.md)。

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
- [CrewAI](https://github.com/crewAIInc/crewAI) — AI Coding Agent Setup 模式灵感
- [AutoGen](https://github.com/microsoft/autogen) — Breaking Changes 横幅模式灵感
- [Dify](https://github.com/langgenius/dify) — Cloud/Self-Host 对比模式灵感
- [Open Interpreter](https://github.com/OpenInterpreter/open-interpreter) — 简洁头部和一键安装模式灵感
- [BabyAGI](https://github.com/yoheinakajima/babyagi) — GitHub Callout 语法灵感

<p align="right">(<a href="#readme-top">回到顶部</a>)</p>

<!-- REFERENCE-STYLE LINK DEFINITIONS -->
[license-shield]: https://img.shields.io/github/license/YHlorra/readme-writer-skill.svg?style=for-the-badge
[license-url]: https://github.com/YHlorra/readme-writer-skill/blob/main/LICENSE
[version-shield]: https://img.shields.io/github/v/tag/YHlorra/readme-writer-skill.svg?style=for-the-badge
[version-url]: https://github.com/YHlorra/readme-writer-skill/releases
[last-commit-shield]: https://img.shields.io/github/last-commit/YHlorra/readme-writer-skill.svg?style=for-the-badge
[last-commit-url]: https://github.com/YHlorra/readme-writer-skill/commits/main
