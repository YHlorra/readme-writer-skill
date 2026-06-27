# Language Support

Generated READMEs are produced as a **two-file bilingual pair** by default:

- `README.md` — English (GitHub renders this by default)
- `README.zh-CN.md` — Simplified Chinese

## Cross-Link Toggle

Both files cross-link via a top-of-file toggle:

```markdown
<a id="readme-top"></a>

**[English](README.md) | [中文](README.zh-CN.md)**
```

GitHub renders `README.md` by default regardless of browser language; the toggle is the manual switch.

## Language Input

Override via the `language` input:

| Value | Output |
|---|---|
| `both` (default) | Both files with cross-link toggle |
| `en` | Only `README.md`, English only |
| `zh-CN` | Only `README.zh-CN.md`, Chinese only |

## Canonical CN Section Titles

| English | 中文 |
|---|---|
| Configuration | 配置 |
| Testing | 测试 |
| Deployment | 部署 / 部署选项 |
| Security | 安全 |
| Architecture | 架构 |
| FAQ | 常见问题 |
| About The Project | 关于本项目 |
| Getting Started | 快速开始 |
| Usage | 使用方法 |
| Contributing | 贡献指南 |
| License | 许可证 |
| Contact | 联系方式 |
| Acknowledgments | 致谢 |
| Quick Start | 快速上手 |
| What is [Project] | 什么是 [Project] |
| Why [Project] | 为什么选择 [Project] |
| Key Features | 核心特性 |
| Features | 特性 |
| Connecting to Models | 连接模型 |
| Model Configuration | 模型配置 |
| Use with AI Coding Agents | AI 编码代理支持 |
| AI Coding Agent Setup | AI 编码代理配置 |
| When to Use [Project] | 适用场景 |
| When (Not) to Use | 适用 / 不适用场景 |
| Cloud / Self-Hosted Options | 云端 / 自托管选项 |
| Deployment Options | 部署选项 |
| Telemetry | 遥测数据 |
| Security Disclosure | 安全披露 |
| Examples | 示例 |
| Tutorials | 教程 |
| Built With | 技术栈 |
| Roadmap | 路线图 |
| Star History | Star 历史 |
| Contributors Wall | 贡献者墙 |
| Related Papers | 相关论文 |
| Community & Support | 社区与支持 |

## Anchor Slug Convention

**English slugs everywhere**, even in zh-CN files. Reason: anchor stability across locales.

- `#about-the-project` (not `#关于本项目`)
- `#getting-started` (not `#快速开始`)
- `#testing` (not `#测试`)
