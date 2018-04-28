#
# Working directory
#
# Current directory. Return only three last items of path

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

DIR_PREFIX="in "
DIR_SUFFIX=""
DIR_TRUNC=3
DIR_TRUNC_REPO=true
DIR_COLOR="cyan"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

prompt_dir() {
  local dir

  # Treat repo root as a top-level directory or not
  if [[ $DIR_TRUNC_REPO == true ]] && prompt::is_git; then
    local git_root=$(git rev-parse --show-toplevel)
    dir="$git_root:t${$(expr $(pwd -P) : "$git_root\(.*\)")}"
  else
    dir="%${DIR_TRUNC}~"
  fi

  prompt::section \
    "$DIR_COLOR" \
    "$DIR_PREFIX" \
    "$dir" \
    "$DIR_SUFFIX"
}
