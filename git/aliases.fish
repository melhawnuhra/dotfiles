# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
if which hub > /dev/null
  alias git=(which hub)
end

if not set -q git_abbrs_initialized
  set -U git_abbrs_initialized
  echo -n Setting Git abbreviations... 

  abbr g 'git'
  abbr ga 'git add'
  abbr gaa 'git add -A'
  abbr gb 'git branch'
  abbr gbl 'git blame'
  abbr gc 'git commit -m'
  abbr gca 'git-amend'
  abbr ge 'git-edit-new'
  abbr go 'git checkout'
  abbr gcp 'git cherry-pick'
  abbr gd 'git diff --color-words'
  abbr gf 'git fetch'
  abbr gl 'git log'
  abbr gm 'git merge'
  abbr gp 'git push'
  abbr gpl 'git pull'
  abbr gr 'git remote'
  abbr gs 'git status -sb'
  abbr gst 'git stash'
  abbr gw 'git-wtf'
  abbr st 'open -a SourceTree .'

  echo 'Done'
end

# Log / status
alias gh="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

