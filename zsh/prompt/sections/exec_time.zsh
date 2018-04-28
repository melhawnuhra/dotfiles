#
# Execution time
#
# Execution time of the last command.

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_EXEC_TIME_PREFIX="⌚︎"
PROMPT_EXEC_TIME_SUFFIX=""
PROMPT_EXEC_TIME_COLOR="yellow"
PROMPT_EXEC_TIME_ELAPSED=2

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

prompt_exec_time() {
  if [[ $PROMPT_EXEC_TIME_duration -ge $PROMPT_EXEC_TIME_ELAPSED ]]; then
    prompt::section \
      "$PROMPT_EXEC_TIME_COLOR" \
      "$PROMPT_EXEC_TIME_PREFIX" \
      "$(prompt::displaytime $PROMPT_EXEC_TIME_duration)" \
      "$PROMPT_EXEC_TIME_SUFFIX"
  fi
}
