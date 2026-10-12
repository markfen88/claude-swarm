# swarm

Claude Code plugin: **Sonnet** does the real work, hands mechanical data pulls/pushes to a **Haiku** subagent, and consults **Opus** as advisor.

| Piece | Name |
|---|---|
| Haiku subagent | `swarm:haiku-runner` |
| Run a task explicitly | `/swarm:run <task>` |
| One-time machine setup | `/swarm:setup` |
| Script wrapper | `scripts/claude-swarm.ps1` / `scripts/claude-swarm.sh` |

## Install (any machine)

```bash
claude plugin marketplace add markfen88/claude-swarm
claude plugin install swarm@markfen88-plugins
```

The repo is private, so git on that machine must be able to clone it (e.g. `gh auth login`).

Then, in a Claude Code session, run `/swarm:setup` once. Plugins can't set the main model or advisor, so this writes `"model": "sonnet"`, `"advisorModel": "opus"` and a delegation rule into your user config.

## Scripts

```powershell
& claude-swarm.ps1 -p "pull the latest logs and summarize errors" --permission-mode acceptEdits
```

- Headless runs can't answer permission prompts: pass `--permission-mode acceptEdits` or `--allowedTools ...` for write/push jobs.
- Don't use `--bare`; it skips plugins and subagents.
- Agent SDK: include the `user` setting source, or send `/advisor opus` as the first prompt.

## Update

```bash
claude plugin marketplace update markfen88-plugins
claude plugin update swarm@markfen88-plugins
```

Bump `version` in `.claude-plugin/plugin.json` when you change things, or installs stay pinned.

## Cloud sessions / claude.ai

Cloud sessions don't read local plugins. Upload the plugin (or just `skills/run`) to your claude.ai account. There, `run` falls back to a general-purpose subagent with model `haiku`, and the advisor must be enabled in that environment separately.
