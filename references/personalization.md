# Personalization via user.json

The skill reads an optional `user.json` to pre-fill recurring fields.

## Recognized Fields

| Field | Used For |
|---|---|
| `github.username` | Replaces `OWNER` in badge URLs and GitHub links |
| `open_source.default_license` | Pre-fills the License section when the project has no LICENSE file |
| `open_source.acknowledgments[]` | Auto-inserted into the Acknowledgments section |
| `sponsorship.*` | Added to Acknowledgments and `.github/FUNDING.yml` |

## Location

`<skill_install_dir>/user.json` — for example `~/.claude/skills/readme-writer/user.json`.

It is **skill-internal**, not per-project: one `user.json` per skill install, shared across every project the skill touches.

## Security

`user.json` is **never committed** when open-sourcing the skill. The skill ships with `.gitignore` excluding it. The maintainer's local copy lives only on their machine.

## Search Order

1. Project root
2. Workspace root
3. `~/.config/readme-writer/`
