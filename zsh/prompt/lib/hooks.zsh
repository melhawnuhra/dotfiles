# ------------------------------------------------------------------------------
# HOOKS
# Zsh hooks for advanced actions
# custom hooks for sections
# ------------------------------------------------------------------------------

# Execution time start
prompt_exec_time_preexec_hook() {
  PROMPT_EXEC_TIME_start=$(date +%s)
}

# Execution time end
prompt_exec_time_precmd_hook() {
  [[ -n $PROMPT_EXEC_TIME_duration ]] && unset PROMPT_EXEC_TIME_duration
  [[ -z $PROMPT_EXEC_TIME_start ]] && return
  local PROMPT_EXEC_TIME_stop=$(date +%s)
  PROMPT_EXEC_TIME_duration=$(( $PROMPT_EXEC_TIME_stop - $PROMPT_EXEC_TIME_start ))
  unset PROMPT_EXEC_TIME_start
}

# vcs_info hook
prompt_exec_vcs_info_precmd_hook() {
  vcs_info
}
