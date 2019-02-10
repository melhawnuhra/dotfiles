# ---- ENVIRONMENT -----

# Environment {{{
set DOTFILES_HOME "$HOME/dotfiles"

if [ -n "$TMUX" ]
  set -x TERM screen-256color
else
  set -x TERM xterm-256color
end

# set LS_COLORS "exfxcxdxbxegedabagacad"
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

set PATH $PATH /usr/local/bin/google-cloud-sdk/bin
# }}}
# Colors {{{

# Readline colors
# set -g fish_color_autosuggestion 555 yellow
#set -g fish_color_command 5f87d7
#set -g fish_color_comment 808080
#set -g fish_color_cwd 87af5f
# set -g fish_color_cwd_root 5f0000
# set -g fish_color_error 870000 --bold
# set -g fish_color_escape af5f5f
#set -g fish_color_history_current 87afd7
#set -g fish_color_host 5f87af
# set -g fish_color_match d7d7d7 --background=303030
#set -g fish_color_normal normal
#set -g fish_color_operator d7d7d7
# set -g fish_color_param 5f87af
#set -g fish_color_redirection normal
# set -g fish_color_search_match --background=purple
# set -g fish_color_status 5f0000
#set -g fish_color_user 5f875f
set -g fish_color_quote d7af5f
set -g fish_color_valid_path --none

# set the color of the selected on in the drop list of TAB #4695
set -g fish_color_search_match --background=blue

set fish_new_pager 1
set -gx fish_color_user magenta
set -gx fish_color_host yellow

#set -g fish_color_dimmed 555
#set -g fish_color_separator 999

## Git prompt status
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream auto
#set -g pure_git_untracked_dirty false

## Status Chars
# set __fish_git_prompt_char_dirtystate '*'
# set __fish_git_prompt_char_upstream_equal ''
# set __fish_git_prompt_char_upstream_ahead '↑'
# set __fish_git_prompt_char_upstream_behind '↓'

# set __fish_git_prompt_color_branch yellow
# set __fish_git_prompt_color_dirtystate red
# set __fish_git_prompt_color_upstream_ahead ffb90f
# set __fish_git_prompt_color_upstream_behind blue

## Local prompt customization
#set -g fish_pager_color_completion normal
#set -g fish_pager_color_description 555 yellow
#set -g fish_pager_color_prefix cyan
#set -g fish_pager_color_progress cyan

# }}}
# Pager {{{
set -x PAGER 'less'
set LESS '--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline
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
  abbr lst 'tree -I "node_modules|dist"'
  abbr killit 'kill -9 %1'                  # Kill the last suspended process (because sometimes Ctrl-C is not enough)
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
alias alert 'terminal-notifier -title "Terminal Alert" -message Done!'

alias mv 'command gmv --interactive --verbose'
alias rm 'command grm --interactive --verbose'
alias cp 'command gcp --interactive --verbose'

alias ls 'exa'
alias l 'exa -l'
alias la 'exa -la'

alias ip 'curl icanhazip.com'               # Get external ip
alias ports 'lsof -iTCP -sTCP:LISTEN -P'    # List listening ports on localhost
alias hosts 'sudo $EDITOR /etc/hosts'

alias pubkey "more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# TODO
# alias colors 'for code in {0..255}; do echo -e "\e[38;05;${code}m $code: test"; done'
# alias today 'vim ~/journal/$(date "+%Y-%m-%d").md'
# alias yesterday 'vim ~/journal/$(ls ~/journal | sort | tail -n 1)'
# }}}

# vim:foldmethod=marker:foldlevel=0
