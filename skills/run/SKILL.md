---
name: run
description: Run a task with the Sonnet-lead / Haiku-runner / Opus-advisor pattern.
argument-hint: <task>
disable-model-invocation: true
model: sonnet
---
Task: $ARGUMENTS

Work this task as the lead:
1. Do the reasoning, planning, debugging and real edits yourself.
2. Hand mechanical data-in/data-out jobs to the `swarm:haiku-runner` subagent: fetching files, logs, command output or docs; copying/uploading/writing content you've already decided. Launch independent jobs in parallel. If that agent isn't available in this environment, spawn a general-purpose subagent with model `haiku` and the same narrow instructions instead.
3. If the advisor tool is available, consult it before committing to a plan, when an error repeats, and before declaring done.
4. Finish with a short summary of what changed and what the Haiku runner handled.
