
# Profile loading time >>
# fish --profile prompt.prof -ic 'fish_prompt; exit'; sort -nk 2 prompt.prof

# Environment {{{
fish_vi_key_bindings

set DOTFILES_HOME "$HOME/dotfiles"

if [ -n "$TMUX" ]
  set -x TERM screen-256color
else
  set -x TERM xterm-256color
end

# set LS_COLORS "exfxcxdxbxegedabagacad"
set CLICOLOR "true"

set -x EDITOR 'nvim'

# Highlight color for grep matches
set -x GREP_COLOR '1;32'

set -x LANG en_US.UTF-8
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LC_COLLATE C

# Custom bin/
set PATH $PATH $DOTFILES_HOME/bin
# Ranger
set RANGER_LOAD_DEFAULT_RC "false"
# Docker
source $DOTFILES_HOME/docker/aliases.fish
# Kubernetes
source $DOTFILES_HOME/kubernetes/abbr.fish
# Git
source $DOTFILES_HOME/git/aliases.fish

set PATH $PATH /usr/local/bin/google-cloud-sdk/bin /Users/jared/Library/Python/3.7/bin /Users/jared/go/bin

# Android SDK
set ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set PATH $PATH $ANDROID_SDK_ROOT/tools/bin $ANDROID_SDK_ROOT/platform-tools $ANDROID_SDK_ROOT/emulator $ANDROID_SDK_ROOT/build-tools

varclear PATH
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

# Set less as default pager
set -x PAGER 'less'

# Set less options
set LESS '--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=2 --window=-4'

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
  abbr cpwd 'pwd | tr -d "\n" | pbcopy'     # Copy pwd
  abbr xx 'atool -x'                        # Extract ANYTHING
  abbr lst 'tree -I "node_modules|dist"'
  abbr killit 'kill -9 %1'                  # Kill the last suspended process (because sometimes Ctrl-C is not enough)
  abbr _ 'sudo'

  abbr fg1 'fg %1'
  abbr fg2 'fg %2'
  abbr fg3 'fg %3'

  abbr cd. 'cd (git rev-parse --show-toplevel); and clear' # cd to the project root
  abbr c.d 'cd (git rev-parse --show-toplevel); and clear' # cd to the project root
  abbr cdc 'cd ~/Code'
  abbr cdd 'cd ~/Desktop'
  abbr cdf 'cd ~/dotfiles/fish'
  abbr cdv 'cd ~/dotfiles/vim'
  abbr cdp 'cd ~/Documents/Personal/Projects'
  abbr cdr 'cd ~/Documents/Personal/Reference'
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
# TMUX {{{
  abbr mux 'tmuxinator'
  alias t 'tmux attach ;or tmux'
  alias tl 'tmux ls'
  alias tl 'tmux ls'
  alias tls 'tmux list-panes -s'
  function tk -d 'tmux kill-session single/multiple sessions'
      if test (count $argv) -gt 0
          for i in $argv
              tmux kill-session -t $i
          end
      else
          echo "Need target sessions"
      end
  end
  function tka -d 'tmux kill-session except given session[s]'
      if test (ps -ef | grep -v grep | grep -i tmux | wc -l ) = 0
          echo "No tmux server is running!!!"
          return
      end
      if test (count $argv) -gt 0
          set -l sid (tl | nl | awk '{print $2}' | sed 's/://g')
          for i in $sid
              if not contains $i $argv
                  tmux kill-session -t $i
                  echo Tmux session $i is killed
              end
          end
          echo \n--------------\n
          echo Left sessions:
          tmux ls
      else
          read -n 1 -l -p 'echo "Kill all tmux sessions including this one? [y/N]"' answer
          if test "$answer" = "y" -o "$answer" = " "
              tmux kill-server        # kill all sessions (including current one)
          end
      end
  end
# }}}
# Aliases {{{

# show a popup when job completes
alias alert 'terminal-notifier -title "Terminal Alert" -message Done!'

if [ "$(uname -s)" == "Darwin" ]
then
  # use gnu utils
  function mv --wraps gmv
    command gmv --verbose $argv
  end
  function rm --wraps grm
    command grm --verbose $argv
  end
  function cp --wraps gcp
    command gcp --verbose $argv
  end
fi

# ls better
alias l 'exa'
alias ls 'exa'
alias ll 'exa -l'
alias lla 'exa -la'
alias lal 'exa -la'
alias la 'exa -a'
alias lt 'ls -l --sort newest; and echo "------Oldest--"'
alias ltr 'ls -l --sort oldest; and echo "------Newest--"'

# get external IP
alias ip 'curl icanhazip.com'

# list listening ports
alias ports 'lsof -iTCP -sTCP:LISTEN -P'
alias hosts 'sudo $EDITOR /etc/hosts'

# copy ssh public key to clipboard
alias pubkey "more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"

# copy output of last command to clipboard
alias cl 'echo $history[1] | tr -d "\n" | pbcopy; and echo "Copied previous command."'

# Quicker brew installs
alias bi 'brew install'

# copy the working directory path
alias cpwd 'pwd|tr -d "\n"|pbcopy'

# top
alias cpu 'top -o cpu'
alias mem 'top -o rsize' # memory

# list TODO/FIX lines from the current project
alias todos "ag --ignore 'node_modules/* .git/* .map' -- '(FIX(ME)?:)|@todo|@Todo|TODO'"

# interactive fasd
alias zi "fasd -e cd -i"

# Flush DNS
alias flush "sudo killall -HUP mDNSResponder"

# Search running processes for a pattern
alias psgrep "ps ax|grep -v grep|grep -iE"
alias psg psgrep


# TODO
# alias colors 'for code in {0..255}; do echo -e "\e[38;05;${code}m $code: test"; done'
# alias today 'vim ~/journal/$(date "+%Y-%m-%d").md'
# alias yesterday 'vim ~/journal/$(ls ~/journal | sort | tail -n 1)'
# }}}
# Plugins {{{

# Pisces
set -U pisces_pairs '<,>' '`,`' '«,»' '","' '\',\'' '(,)' '[,]' '{,}'

# }}}

# vim:foldmethod=marker:foldlevel=0
