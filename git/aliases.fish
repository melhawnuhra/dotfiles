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
  abbr gacp 'git add -A; and git-amend; and git push origin +master'
  abbr gap 'git add -p'
  abbr gb 'git branch'
  abbr gbl 'git blame'
  abbr gc 'git commit -m'
  abbr gca 'git-amend'
  abbr ge 'git-edit-new'
  abbr go 'git checkout'
  abbr gcp 'git cherry-pick'
  abbr gd 'git diff --color-words'
  abbr gds 'git diff --color-words --staged'
  abbr gf 'git fetch'
  abbr gl 'git log'
  abbr gm 'git merge'
  abbr gp 'git push'
  abbr gpo 'git push origin'
  abbr gpod 'git push origin dev'
  abbr gpom 'git push origin master'
  abbr gpo+m 'git push origin +master'
  abbr gpl 'git pull'
  abbr gr 'git remote'
  abbr gs 'git status -sb'
  abbr gst 'git stash'
  abbr gstp 'git stash pop'
  abbr gstl 'git stash list'
  abbr gw 'git-wtf'
  abbr st 'open -a SourceTree .'

  echo 'Done'
end

# Log / status
alias gh="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# add and remove new/deleted files from git index automatically
alias gitar="git ls-files -d -m -o -z --exclude-standard | xargs -0 git update-index --add --remove"
# git push
alias gpd="git push origin develop"
alias gpm="git push origin master"
# Remove git from a project
alias ungit="find . -name '.git' -exec rm -rf {} \;"
