#
# Node.js
#
# Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine.
# Link: https://nodejs.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_NODE_PREFIX=" via "
PROMPT_NODE_SUFFIX=""
PROMPT_NODE_SYMBOL="⬢ "
PROMPT_NODE_DEFAULT_VERSION=""
PROMPT_NODE_COLOR="green"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of node, exception system.
prompt_node() {
  # Show NODE status only for JS-specific folders
  [[ -f package.json || -d node_modules || -n *.js(#qN^/) ]] || return

  local node_version

# if prompt::exists nvm; then
# node_version=$(nvm current 2>/dev/null)
# [[ $node_version == "system" || $node_version == "node" ]] && return
# elif prompt::exists nodenv; then
# node_version=$(nodenv version-name)
# [[ $node_version == "system" || $node_version == "node" ]] && return
  if prompt::exists node; then
    node_version=$(node -v 2>/dev/null)
  else
    return
  fi

  [[ $node_version == $PROMPT_NODE_DEFAULT_VERSION ]] && return

  prompt::section \
    "$PROMPT_NODE_COLOR" \
    "$PROMPT_NODE_PREFIX" \
    "${PROMPT_NODE_SYMBOL}${node_version}" \
    "$PROMPT_NODE_SUFFIX"
}
