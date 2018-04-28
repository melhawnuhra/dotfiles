# word/sentence/line nagivation
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

bindkey '^[begin' beginning-of-line
bindkey '^[end' end-of-line
bindkey '^[backclearline' backward-kill-line
# bindkey '^[forwardclearline' forward-kill-line

# up directory
function up_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

# git super speed
# function git_prepare() {
# 	if [ -n "$BUFFER" ];
# 		then
# 			BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
# 	fi

# 	if [ -z "$BUFFER" ];
# 		then
# 			BUFFER="git add -A; git commit -v && git push"
# 	fi

# 	zle accept-line
# }
# zle -N git_prepare
# bindkey "^g" git_prepare

# LS
function ctrl_l() {
    BUFFER="ls"
    zle accept-line
}
zle -N ctrl_l
bindkey "^l" ctrl_l

# Enter
function enter_line() {
    zle accept-line
}
zle -N enter_line
bindkey "^o" enter_line

# Sudo
function add_sudo() {
    BUFFER="sudo "$BUFFER
    zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo
