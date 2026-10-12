---
name: setup
description: One-time per machine - make Sonnet the default model, Opus the advisor, and add the swarm delegation rule to the user CLAUDE.md.
disable-model-invocation: true
---
Configure this machine for the swarm workflow. Plugins can't set these themselves, so edit the user-level files directly:

1. In `~/.claude/settings.json` (create if missing), merge in these keys without removing anything else:
   `"model": "sonnet"` and `"advisorModel": "opus"`.
2. In `~/.claude/CLAUDE.md` (create if missing), ensure this section exists exactly once (replace an older `# Delegation` section if present):

   ```
   # Delegation
   Do the reasoning, planning, debugging, and real edits yourself. Delegate to the `swarm:haiku-runner` subagent only for mechanical data-in/data-out tasks (fetching files, logs, command output or docs; copying/uploading/writing content you've already decided). Run independent haiku-runner tasks in parallel.
   ```
3. Show the user the resulting diff and tell them new sessions pick it up (current session: switch to Sonnet in the model picker).
