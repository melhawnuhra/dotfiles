#
# PHP
#
# PHP is a server-side scripting language designed primarily for web development.
# Link: http://www.php.net/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

PROMPT_PHP_PREFIX=" using "
PROMPT_PHP_SUFFIX=""
PROMPT_PHP_SYMBOL="🐘 "
PROMPT_PHP_COLOR="blue"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of PHP
prompt_php() {
  # Show only if php files or composer.json exist in current directory
  [[ -n *.php(#qN^/) || -f composer.json ]] || return

  prompt::exists php || return

  local php_version=$(php -v 2>&1 | grep --color=never -oe "^PHP\s*[0-9.]\+" | awk '{print $2}')

  prompt::section \
    "$PROMPT_PHP_COLOR" \
    "$PROMPT_PHP_PREFIX" \
    "${PROMPT_PHP_SYMBOL}v${php_version}" \
    "${PROMPT_PHP_SUFFIX}"
}
