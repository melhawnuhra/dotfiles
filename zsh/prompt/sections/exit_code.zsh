#
# Exit code
#
# Show exit code of last executed command

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_EXIT_CODE_SHOW="${PROMPT_EXIT_CODE_SHOW=false}"
PROMPT_EXIT_CODE_PREFIX="${PROMPT_EXIT_CODE_PREFIX=""}"
PROMPT_EXIT_CODE_SUFFIX="${PROMPT_EXIT_CODE_SUFFIX=" "}"
PROMPT_EXIT_CODE_SYMBOL="${PROMPT_EXIT_CODE_SYMBOL="✘"}"
PROMPT_EXIT_CODE_COLOR="${PROMPT_EXIT_CODE_COLOR="red"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

prompt_exit_code() {
  [[ $PROMPT_EXIT_CODE_SHOW == false || $RETVAL == 0 ]] && return

  prompt::section \
    "$PROMPT_EXIT_CODE_COLOR" \
    "$PROMPT_EXIT_CODE_PREFIX" \
    "${PROMPT_EXIT_CODE_SYMBOL}$RETVAL" \
    "$PROMPT_EXIT_CODE_SUFFIX"
}
