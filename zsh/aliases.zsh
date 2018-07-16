alias reload='. ~/.zshrc'   # Re-source .zshrc
alias c='clear'             # Keep the screen tidy
alias q='exit'
alias dux='du -x --max-depth=1 | sort -n'   # Which directory is hiding all the bytes?
alias alert='terminal-notifier -title "Terminal Alert" -message Done!'
alias cats='pygmentize -g'          # Syntax-highlighted cat
alias cpwd='pwd|tr -d "\n"|pbcopy'  # Copy pwd
alias code='code-insiders'
alias xx='atool -x'               # todo: replace extract() after auditioning this
alias killit='kill -9 %%'         # Kill the last suspended process (because sometimes Ctrl-C is not enough)
alias _='sudo'

alias t='tmux'
alias mux='tmuxinator'

# Tired of piping?
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'
alias -g G='|grep'
alias -g C='|wc -l'
alias -g S='|sort'
alias -g N='> /dev/null 2>&1'

# Fuck alias
if $(which thefuck &>/dev/null)
then
    eval $(thefuck --alias)
fi

# cd to project root
alias cd.='cd $(git rev-parse --show-toplevel)'

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

# I do this almost every time I 'cd' anyway
unalias cd 2>/dev/null
function chd() {
  cd $1 && ls
}
alias cd="chd"

# Mkdir, deeply if required and cd into it
function take() {
  mkdir -p $1
  cd $1
}

# Page markdown in color
function md() {
  mdv $1 | less -R
}

# Download youtube videos as m4a audio
function m4a() {
  youtube-dl $1 -x --audio-format m4a
}

