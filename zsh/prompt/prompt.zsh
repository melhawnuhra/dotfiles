export PROMPT_ROOT=$DOTFILES_HOME/zsh/prompt

# --- CONFIG ---
NEWLINE='
'

PROMPT_ORDER=(
  user
  dir
  git
  node
  php
  line_sep
  exit_code
  char
)
RPROMPT_ORDER=(
 # Empty by default
)

# --- LIBS ---

source "$PROMPT_ROOT/lib/utils.zsh"
source "$PROMPT_ROOT/lib/hooks.zsh"
source "$PROMPT_ROOT/lib/section.zsh"

# --- SECTIONS ---

for section in $(prompt::union $PROMPT_ORDER $RPROMPT_ORDER); do
  if [[ -f "$PROMPT_ROOT/sections/$section.zsh" ]]; then
    source "$PROMPT_ROOT/sections/$section.zsh"
  elif prompt::defined "prompt_$section"; then
    # Custom section is declared, nothing else to do
    continue
  else
    echo "Section '$section' not found. Skipping."
  fi
done

# --- PROMPTS ---

# Primary prompt
prompt_prompt() {
  # Retrieve exit code of last command (for use in exit_code)
  RETVAL=$?

  echo -n "$NEWLINE"
  prompt::compose_prompt $PROMPT_ORDER
}

# Right (secondary) prompt
prompt_rprompt() {
  # Retrieve exit code of last command (for use in exit_code)
  RETVAL=$?

  prompt::compose_prompt $RPROMPT_ORDER
}

# Continuation (interactive) prompt
prompt_ps2() {
  # Retrieve exit code of last command
  RETVAL=$?

  prompt::section "$CHAR_COLOR_SECONDARY" $CHAR_SYMBOL
}

# --- SETUP FUNCTION ---

prompt_setup() {
  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook

  # Prevent % showing up if output doesn't end with a newline
  export PROMPT_EOL_MARK=''

  # setopt noprompt{bang,cr,percent,subst} "prompt${^prompt_opts[@]}"

  # Add exec_time hooks
  add-zsh-hook preexec prompt_exec_time_preexec_hook
  add-zsh-hook precmd prompt_exec_time_precmd_hook

  # Configure vcs_info helper for use later on
  add-zsh-hook precmd prompt_exec_vcs_info_precmd_hook
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '%b'

  # Expose the prompt to the environment
  PROMPT='$(prompt_prompt)'
  PS2='$(prompt_ps2)'
  RPS1='$(prompt_rprompt)'
}

# --- ENTRY POINT ---

# Pass all args to the prompt_setup function
prompt_setup "$@"

