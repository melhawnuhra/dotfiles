#
# Prompt character
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_CHAR_PREFIX="${PROMPT_CHAR_PREFIX=""}"
PROMPT_CHAR_SUFFIX="${PROMPT_CHAR_SUFFIX=""}"
#PROMPT_CHAR_SYMBOL="${PROMPT_CHAR_SYMBOL="➜ "}"
PROMPT_CHAR_SYMBOL="${PROMPT_CHAR_SYMBOL="❯ "}"
PROMPT_CHAR_COLOR_SUCCESS="${PROMPT_CHAR_COLOR_SUCCESS="green"}"
PROMPT_CHAR_COLOR_FAILURE="${PROMPT_CHAR_COLOR_FAILURE="red"}"
PROMPT_CHAR_COLOR_SECONDARY="${PROMPT_CHAR_COLOR_SECONDARY="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Paint $PROMPT_SYMBOL in red if previous command was fail and
# paint in green if everything was OK.
prompt_char() {
  local color

  if [[ $RETVAL -eq 0 ]]; then
    color="$PROMPT_CHAR_COLOR_SUCCESS"
  else
    color="$PROMPT_CHAR_COLOR_FAILURE"
  fi

  prompt::section \
    "$color" \
    "$PROMPT_CHAR_PREFIX" \
    "$PROMPT_CHAR_SYMBOL" \
    "$PROMPT_CHAR_SUFFIX"
}
