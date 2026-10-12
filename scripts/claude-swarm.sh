#!/usr/bin/env bash
# Sonnet lead + Opus advisor; swarm:haiku-runner comes from the installed plugin.
exec claude --model sonnet --advisor opus "$@"
