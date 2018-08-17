# ---- ENVIRONMENT -----

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

# ---- PAGER ----

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

# ---- ALIASES -----

alias c='clear'             # Keep the screen tidy
alias q='exit'
alias dux='du -x --max-depth=1 | sort -n'   # Which directory is hiding all the bytes?
alias alert='terminal-notifier -title "Terminal Alert" -message Done!'
alias cats='pygmentize -g'          # Syntax-highlighted cat
alias cpwd='pwd|tr -d "\n"|pbcopy'  # Copy pwd
alias xx='atool -x'               # todo: replace extract() after auditioning this
alias killit='kill -9 %%'         # Kill the last suspended process (because sometimes Ctrl-C is not enough)
alias _='sudo'

alias t='tmux'
alias mux='tmuxinator'

# cd to project root
alias cd.='cd (git rev-parse --show-toplevel)'


alias cd..="cd .." # I often do this

# Because sometimes you just don't have the time for those extra keystrokes
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# Do we need more?

# We need rainbows
alias ls='exa'
alias l='exa -l'
alias la='exa -la'

# I do this almost every time I 'cd' anyway
function cd --description 'ls immediately after changing directory'
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end

function take --description 'mkdir, deeply if required, and then cd into it'
  mkdir -p $argv; and cd $argv
end

function md --description 'Page markdown in color'
  mdv $argv | less -R
end

function m4a --description 'Download youtube videos as m4a audio'
  youtube-dl $argv -x --audio-format m4a
end

