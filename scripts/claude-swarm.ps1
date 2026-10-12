# Sonnet lead + Opus advisor; swarm:haiku-runner comes from the installed plugin.
# All arguments pass through, e.g.:
#   claude-swarm.ps1 -p "pull the logs and summarize" --permission-mode acceptEdits
& claude --model sonnet --advisor opus @args
exit $LASTEXITCODE
