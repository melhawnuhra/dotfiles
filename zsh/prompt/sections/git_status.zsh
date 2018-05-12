#
# Git status
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_GIT_STATUS_PREFIX=" ["
PROMPT_GIT_STATUS_SUFFIX="]"
PROMPT_GIT_STATUS_COLOR="red"
PROMPT_GIT_STATUS_UNTRACKED="…"
PROMPT_GIT_STATUS_ADDED="✚"
PROMPT_GIT_STATUS_MODIFIED="~"
PROMPT_GIT_STATUS_RENAMED="»"
PROMPT_GIT_STATUS_DELETED="-"
PROMPT_GIT_STATUS_STASHED="⚑"
PROMPT_GIT_STATUS_UNMERGED="✖"
PROMPT_GIT_STATUS_AHEAD="↑"
# PROMPT_GIT_STATUS_AHEAD="⇡"
PROMPT_GIT_STATUS_BEHIND="↓"
# PROMPT_GIT_STATUS_BEHIND="⇣"
PROMPT_GIT_STATUS_DIVERGED="⇕"

PROMPT_GIT_STATUS_STAGED="●" # TODO

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

prompt_git_status() {
  local INDEX=$(command git status --porcelain -b 2> /dev/null)
  local git_status=""

  # Check for stashes
  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    git_status+="$PROMPT_GIT_STATUS_STASHED"
  fi

  # Check whether branch is ahead or behind
  local is_ahead=false
  local is_behind=false
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    is_ahead=true
  fi
  if $(echo "$INDEX" | command grep '^## [^ ]\+ .*behind' &> /dev/null); then
    is_behind=true
  fi

  # Check wheather branch has diverged
  if [[ "$is_ahead" == true && "$is_behind" == true ]]; then
    git_status+="$PROMPT_GIT_STATUS_DIVERGED"
  else
    [[ "$is_ahead" == true ]] && git_status+="$PROMPT_GIT_STATUS_AHEAD"
    [[ "$is_behind" == true ]] && git_status+="$PROMPT_GIT_STATUS_BEHIND"
  fi

  # Check for unmerged files
  if $(echo "$INDEX" | command grep '^U[UDA] ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_UNMERGED"
  elif $(echo "$INDEX" | command grep '^AA ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_UNMERGED"
  elif $(echo "$INDEX" | command grep '^DD ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_UNMERGED"
  elif $(echo "$INDEX" | command grep '^[DA]U ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_UNMERGED"
  fi

  # Check for deleted files
  if $(echo "$INDEX" | command grep '^[MARCDU ]D ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_DELETED"
  elif $(echo "$INDEX" | command grep '^D[ UM] ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_DELETED"
  fi

  # Check for renamed files
  if $(echo "$INDEX" | command grep '^R[ MD] ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_RENAMED"
  fi

  # Check for modified files
  if $(echo "$INDEX" | command grep '^[ MARC]M ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_MODIFIED"
  fi

  # Check for staged files
  if $(echo "$INDEX" | command grep '^A[ MDAU] ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_ADDED"
  elif $(echo "$INDEX" | command grep '^M[ MD] ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_ADDED"
  elif $(echo "$INDEX" | command grep '^UA' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_ADDED"
  fi

  # Check for untracked files
  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    git_status+="$PROMPT_GIT_STATUS_UNTRACKED"
  fi

  if [[ -n $git_status ]]; then
    # Status prefixes are colorized
    prompt::section \
      "$PROMPT_GIT_STATUS_COLOR" \
      "$PROMPT_GIT_STATUS_PREFIX$git_status$PROMPT_GIT_STATUS_SUFFIX"
  fi
}
