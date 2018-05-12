#
# Git branch
#
# Show current git branch

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_GIT_BRANCH_PREFIX="  "
PROMPT_GIT_BRANCH_SUFFIX=""
PROMPT_GIT_BRANCH_COLOR="magenta"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

prompt_git_branch() {
  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  git_current_branch="${git_current_branch#heads/}"
  git_current_branch="${git_current_branch/.../}"

  prompt::section \
    "$PROMPT_GIT_BRANCH_COLOR" \
    "$PROMPT_GIT_BRANCH_PREFIX${git_current_branch}$PROMPT_GIT_BRANCH_SUFFIX"
}
