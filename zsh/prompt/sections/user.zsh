#
# Username
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

# --------------------------------------------------------------------------
# | PROMPT_USER_SHOW | show username on local | show username on remote |
# |---------------------+------------------------+-------------------------|
# | false               | never                  | never                   |
# | always              | always                 | always                  |
# | true                | if needed              | always                  |
# | needed              | if needed              | if needed               |
# --------------------------------------------------------------------------

PROMPT_USER_SHOW=true
PROMPT_USER_PREFIX="with "
PROMPT_USER_SUFFIX=" "
PROMPT_USER_COLOR="yellow"
PROMPT_USER_COLOR_ROOT="red"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

prompt_user() {
  [[ $PROMPT_USER_SHOW == false ]] && return

  if [[ $PROMPT_USER_SHOW == 'always' ]] \
  || [[ $LOGNAME != $USER ]] \
  || [[ $UID == 0 ]] \
  || [[ $PROMPT_USER_SHOW == true && -n $SSH_CONNECTION ]]
  then
    local user_color

    if [[ $USER == 'root' ]]; then
      user_color=$PROMPT_USER_COLOR_ROOT
    else
      user_color="$PROMPT_USER_COLOR"
    fi

    prompt::section \
      "$user_color" \
      "$PROMPT_USER_PREFIX" \
      '%n' \
      "$PROMPT_USER_SUFFIX"
  fi
}
