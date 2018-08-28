# ---- ENVIRONMENT -----

# Environment {{{
set DOTFILES_HOME "$HOME/dotfiles"

if [ -n "$TMUX" ]
  set -x TERM screen-256color
else
  set -x TERM xterm-256color
end

set -xU EXA_COLORS "di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34:su=0:sg=0:tw=0:ow=0:"
set LSCOLORS "exfxcxdxbxegedabagacad"
set CLICOLOR "true"

set -x EDITOR 'nvim'

set -x LANG en_US.UTF-8
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LC_COLLATE C

# TODO Use find instead. Include aliases.fish and fix git/path.fish hack
for file in (ls $DOTFILES_HOME/**/path.fish | grep -v "fish/")
  if [ "$file" != 'ls' ]
    source $file
  end
end
# }}}
# Pager {{{
set -x PAGER 'less'
set LESS '--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

## Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
# set LESS_TERMCAP_mb '\E[1;31m'     # begin bold
# set LESS_TERMCAP_md '\E[1;36m'     # begin blink
# set LESS_TERMCAP_me '\E[0m'        # reset bold/blink
# set LESS_TERMCAP_so '\E[01;44;33m' # begin reverse video
# set LESS_TERMCAP_se '\E[0m'        # reset reverse video
# set LESS_TERMCAP_us '\E[1;32m'     # begin underline
# set LESS_TERMCAP_ue '\E[0m'        # reset underline
# }}}
# Abbreviations {{{
if not set -q abbrs_initialized
  set -U abbrs_initialized
  echo -n Setting abbreviations...

  abbr c 'clear'
  abbr q 'exit'
  abbr dux 'du -h | sort -rh | head -5'     # Where are all the bytes hiding?
  abbr cats 'pygmentize -g'                 # Syntax-highlighted cat
  abbr cpwd 'pwd | tr -d "\n" | pbcopy'     # Copy pwd
  abbr xx 'atool -x'                        # Extract ANYTHING
  abbr killit 'kill -9 %%'                  # Kill the last suspended process (because sometimes Ctrl-C is not enough)
  abbr _ 'sudo'
  abbr t 'tmux'
  abbr mux 'tmuxinator'

  abbr cd. 'cd (git rev-parse --show-toplevel)' # cd to the project root
  abbr cd.. 'cd ..'                         # Correct my typos, please

  abbr .. 'cd ..'
  abbr ... 'cd ../..'
  abbr .... 'cd ../../..'
  abbr ..... 'cd ../../../..'
  abbr ...... 'cd ../../../../..'
  # ...because sometimes you just don't have the time for those extra keystrokes.

  echo 'Done'
end
# }}}
# Aliases {{{
alias alert='terminal-notifier -title "Terminal Alert" -message Done!'

alias ls='exa'
alias l='exa -l'
alias la='exa -la'

# TODO
# alias colors='for code in {0..255}; do echo -e "\e[38;05;${code}m $code: test"; done'
# alias today='vi ~/notes/today/$(date "+%Y-%m-%d").md'
# alias yesterday='vi ~/notes/today/$(ls ~/notes/today | sort | tail -n 1)'
# alias clean="git reset --hard HEAD && git clean -df"
# }}}

# vim:foldmethod=marker:foldlevel=0
