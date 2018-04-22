autoload -U colors && colors

setopt PROMPT_SUBST

set_prompt() {
	PS1="%{$reset_color%}"

	# Path: http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/
	PS1+="%{$fg_bold[cyan]%}${PWD/#$HOME/~}%{$reset_color%}"

	# Git
	if git rev-parse --is-inside-work-tree 2> /dev/null | grep -q 'true' ; then
		PS1+=' '
		PS1+="%{$fg[magenta]%}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%{$reset_color%}"
		if [ $(git status --short | wc -l) -gt 0 ]; then
			PS1+="%{$fg[red]%}+$(git status --short | wc -l | awk '{$1=$1};1')%{$reset_color%}"
		fi
	fi

	# Status Code
	PS1+='%(?.. %{$fg[red]%}%?%{$reset_color%})'

	# Sudo: https://superuser.com/questions/195781/sudo-is-there-a-command-to-check-if-i-have-sudo-and-or-how-much-time-is-left
	CAN_I_RUN_SUDO=$(sudo -n uptime 2>&1|grep "load"|wc -l)
	if [ ${CAN_I_RUN_SUDO} -gt 0 ]
	then
		PS1+=', '
		PS1+="%{$fg_bold[red]%}SUDO%{$reset_color%}"
	fi

    PS1+="%{$fg[green] %(?.%F{green}.%F{red})❯ %{$reset_color%}% "
}

# precmd_functions+=set_prompt
# zmodload zsh/datetime
autoload -Uz add-zsh-hook
# autoload -Uz vsc_info
add-zsh-hook preexec prompt_preexec

add-zsh-hook precmd prompt_precmd
add-zsh-hook precmd set_prompt

prompt_preexec () {
   cmd_timestamp=$EPOCHSECONDS
}

prompt_precmd () {
    print -P ' %F{yellow}`cmd_exec_time`%f'
    unset cmd_timestamp

    # set_prompt
}

human_time() {
    local tmp=$1
	local days=$(( tmp / 60 / 60 / 24 ))
	local hours=$(( tmp / 60 / 60 % 24 ))
	local minutes=$(( tmp / 60 % 60 ))
	local seconds=$(( tmp % 60 ))
	echo -n "⌚︎ "
	(( $days > 0 )) && echo -n "${days}d "
	(( $hours > 0 )) && echo -n "${hours}h "
	(( $minutes > 0 )) && echo -n "${minutes}m "
	echo "${seconds}s"
}

cmd_exec_time() {
    local stop=$EPOCHSECONDS
	local start=${cmd_timestamp:-$stop}
	integer elapsed=$stop-$start

	(($elapsed > 2)) && human_time $elapsed
}
