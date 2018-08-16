
# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
if which hub > /dev/null
  alias git=(which hub)
end

alias g="git"

# Commit / staging
alias ga='git add'
alias gc='git commit -m'
alias gca='git-amend'
alias gaa='git add -A'
alias gac='git add -A; and git commit -m'
alias ge='git-edit-new'

# Branching
alias gb='git branch'
alias go='git checkout'
alias gcb='git-copy-branch-name'

# Log / status
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gl='git log --oneline'
alias gh="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color-words'

# Pull / push
alias gu='git push'
alias gp='git pull --rebase --prune'
alias gpp='git pull --rebase; and git push'

alias gw='git-wtf'
alias st='open -a SourceTree .'
