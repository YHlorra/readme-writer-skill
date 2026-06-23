# Examples

End-to-end demonstration of `readme-writer`.

## Layout

```
examples/
├── README.md                        # this file
├── sample-project/                  # input: a minimal Node.js CLI
│   ├── package.json
│   ├── src/
│   │   └── index.js
│   └── README.md                    # input: weak, 7-line user-authored README
└── output/
    ├── README.md                    # output: English README
    └── README.zh-CN.md              # output: Simplified Chinese README
```

## Bilingual output

By default the skill produces a **two-file pair** with a cross-link toggle at the top:

- `output/README.md` — English (GitHub renders this by default)
- `output/README.zh-CN.md` — Simplified Chinese

Both files share the same structure and badge URLs. To opt out of bilingual output, pass `language: "en"` or `language: "zh-CN"` when invoking the skill.

## The fixture: hello-counter

`hello-counter` is a deliberately tiny Node.js CLI that counts lines from stdin. It is intentionally under-documented so the skill's improvement is obvious.

| Input artifact | Role |
|---|---|
| `sample-project/package.json` | Provides name, version, license, bin entry |
| `sample-project/src/index.js` | Source code — script reads from `process.stdin` |
| `sample-project/README.md` | The weak README the user started with |

## What the skill produces

Run the skill against `sample-project/` with the `cli` template variant. Expected output lives in `output/README.md`.

Differences worth noticing:

- The output has **shields.io badges** in reference style at the bottom.
- The output has a **collapsible Table of Contents** anchored to actual headings.
- The output has **back-to-top links** after every section.
- The output adds a **Roadmap** section even though the user didn't write one, because libraries/CLIs benefit from forward-looking structure.
- The output fills `Getting Started -> Installation` with the actual install path inferred from `package.json`.

## How to reproduce

In a Claude conversation with the skill installed:

> Generate a README for `examples/sample-project/` using the `cli` template.

Compare the result to `examples/output/README.md`. They should match section-by-section.

You can also run the verifier on the output:

```sh
bash scripts/verify_readme.sh examples/output/README.md
```