# --------------- FISH CONFIG ----------------

# Environment {{{
fish_vi_key_bindings

set DOTFILES_HOME "$HOME/dotfiles"
set -x EDITOR 'nvim'

set -x LANG en_US.UTF-8
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"
set -x LC_COLLATE C

# Custom bin/
set PATH $PATH $DOTFILES_HOME/bin
# Python3
set PATH $PATH /usr/local/opt/python@3.8/bin
# Homebrew
set PATH $PATH /opt/homebrew/bin
# Android SDK
set ANDROID_SDK_ROOT $HOME/Library/Android/sdk
set PATH $PATH $ANDROID_SDK_ROOT/tools/bin $ANDROID_SDK_ROOT/platform-tools $ANDROID_SDK_ROOT/emulator $ANDROID_SDK_ROOT/build-tools
# Misc
set PATH $PATH /usr/local/bin/google-cloud-sdk/bin $HOME/Library/Python/3.7/bin $HOME/go/bin
# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
varclear PATH

# Docker
source $DOTFILES_HOME/fish/aliases/docker.fish
# Kubernetes
source $DOTFILES_HOME/fish/aliases/k8s.fish
# Git
source $DOTFILES_HOME/fish/aliases/git.fish

# }}}
# Colors {{{

if [ -n "$TMUX" ]
  set -x TERM screen-256color
else
  set -x TERM xterm-256color
end

set CLICOLOR "true"

# Highlight color for grep matches
set -x GREP_COLOR '1;32'

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
# TMUX {{{
  alias t 'tmux attach ;or tmux'
  alias ti 'tmux new-session -t 0'
  alias tl 'tmux ls'
  alias tc 'tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t'

  function ta -d 'Attach to a tmux session by name'
    if count $argv > 0
        tmux attach -t $argv[1]
    else
        echo "Usage: tmux_attach <session-name>"
    end
  end
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
  function trn -d 'Rename the current tmux session'
    if count $argv > 0
        tmux rename-session $argv[1]
        echo "Current session renamed to \"$argv[1]\""
    else
        echo "Usage: tmux_rename <new-session-name>"
    end
  end
# }}}
# Aliases {{{

# show a popup when job completes
alias alert 'terminal-notifier -title "Terminal Alert" -message Done!'

if test "(uname -s)" = "Darwin"
then
  # use gnu utils
  function mv --wraps gmv
    command gmv --verbose $argv
  end
  function rm --wraps grm
    command grm $argv
    # command grm --verbose $argv
  end
  function cp --wraps gcp
    command gcp $argv
    # command gcp --verbose $argv
  end
end

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

# Flush DNS
alias flush "sudo killall -HUP mDNSResponder"

# Search running processes for a pattern
alias psgrep "ps ax|grep -v grep|grep -iE"
alias psg psgrep
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
  abbr cdc 'cd ~/code'
  abbr cdd 'cd ~/Desktop'
  abbr cdf 'cd ~/dotfiles/fish'
  abbr cdv 'cd ~/dotfiles/vim'
  abbr cd.. 'cd ..'

  abbr .. 'cd ..'
  abbr ... 'cd ../..'
  abbr .... 'cd ../../..'
  abbr ..... 'cd ../../../..'
  abbr ...... 'cd ../../../../..'

  echo 'Done'
end
# }}}
# Plugins {{{

# Pisces
set -U pisces_pairs '<,>' '`,`' '«,»' '","' '\',\'' '(,)' '[,]' '{,}'

# }}}
# Useful Notes + Commands {{{
# Profile loading time >>
# fish --profile prompt.prof -ic 'fish_prompt; exit'; sort -nk 2 prompt.prof
# }}}

# vim:foldmethod=marker:foldlevel=0
