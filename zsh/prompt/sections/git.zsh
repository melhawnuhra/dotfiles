#
# Git
#

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_GIT_PREFIX=" on"
PROMPT_GIT_SUFFIX=""
PROMPT_GIT_SYMBOL="  "

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

source "$PROMPT_ROOT/sections/git_branch.zsh"
source "$PROMPT_ROOT/sections/git_status.zsh"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show both git branch and git status:
#   prompt_git_branch
#   prompt_git_status
prompt_git() {
  local git_branch="$(prompt_git_branch)" git_status="$(prompt_git_status)"

  [[ -z $git_branch ]] && return

  prompt::section \
    'white' \
    "$PROMPT_GIT_PREFIX" \
    "${git_branch}${git_status}" \
    "$PROMPT_GIT_SUFFIX"
}
