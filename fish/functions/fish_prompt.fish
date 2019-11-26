# biras_weird_cousin
# Theme based on Bira theme from oh-my-zsh: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/bira.zsh-theme
# Some code stolen from oh-my-fish clearance theme: https://github.com/bpinto/oh-my-fish/blob/master/themes/clearance/
set color_blue 16BAC5
set color_blue_bold BBF0FF
set color_purple A45497
set color_green 26C485
set color_red FF3366
set color_yellow EAC435

# Adds a badge if we're in an SSH session (first letter of hostname, uppercased)
function __ssh_badge
	if test -n "$SSH_CLIENT$SSH2_CLIENT$SSH_TTY"
		set_color -b d6aeec -o 2a0a8b
		echo -n " "(string upper (string sub -s 1 -l 1 (hostname -s)))" "
		set_color normal
	end
end

# only display a host name if we're in an ssh session
function __ssh_host
	if test -n "$SSH_CLIENT$SSH2_CLIENT$SSH_TTY"
		set_color -d white
		echo -n $USER@
		set_color normal
		set_color -d -o brmagenta
		echo -n (hostname -s)
		set_color normal
	end
end

function __user_host
	if test (id -u) -eq 0
		set_color --bold $color_red
	else
		set_color --bold $color_green
	end
	echo -n $USER@(hostname -s) (set_color normal)
end

function __current_path
	# Replace HOME with ~
	set -l path (string replace "$HOME" (set_color $color_purple)"~"(set_color -d $color_blue) (pwd))
	# Highlight last path element
	set -l parts (string split "/" $path)
	set parts[-1] (set_color normal)(set_color -o $color_blue_bold)$parts[-1](set_color normal)
	set path (string join "/" $parts)

	echo -n " "$path(set_color normal)
end

function _background_jobs_icon
  set -l jobs_amount (jobs | grep -v "fasd \-\-sanitize" | wc -l | xargs)

  set_color $color_yellow
  if test $jobs_amount -eq 0
    echo ""
  else if test $jobs_amount -eq 1
      echo "✦"
  else
    echo "$jobs_amount✦"
  end
end

function _git_branch_name
	echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
	echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function __git_status
  if [ (_git_branch_name) ]
    set -l git_branch (_git_branch_name)

    if [ (_git_is_dirty) ]
      set git_color "$color_yellow"
      set git_info '('$git_branch"*"')'
    else
      set git_color "$color_green"
      set git_info '('$git_branch')'
    end

    echo -n (set_color $git_color) $git_info (set_color normal)
  end
end

function fish_prompt
  set -l st $status
  set -l pchar (set_color $color_purple)"❯"
  if [ $st != 0 ];
          set pchar (set_color --bold $color_red)"❯"
  end

  echo -n (set_color $color_blue)"╭─"(set_color normal)
  # __user_host
  __ssh_badge
  __current_path
  __git_status
  echo -e ''

  echo -e (set_color $color_blue)"╰─"(_background_jobs_icon)"$pchar "(set_color normal)
end

function fish_right_prompt
  set -l st $status
  if [ $st != 0 ];
          echo (set_color $color_red) ↵ $st (set_color normal)
  end
  __ssh_host
  set_color -o 666
  date '+ %T'
  set_color normal
end

