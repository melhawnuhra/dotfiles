export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

export SSH_KEY_PATH="~/.ssh/rsa_id"

ZSH_THEME=""
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=( osx z wd zsh-syntax-highlighting )
source $HOME/.oh-my-zsh/oh-my-zsh.sh

fpath=($DOTFILES_HOME/functions $fpath)

autoload -U $DOTFILES_HOME/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# Allow autocompletion of aliases
setopt no_complete_aliases

# Keybindings for word/sentence/line nagivation
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

bindkey '^[begin' beginning-of-line
bindkey '^[end' end-of-line
bindkey '^[backclearline' backward-kill-line
bindkey '^[forwardclearline' forward-kill-line

# Better history
# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down