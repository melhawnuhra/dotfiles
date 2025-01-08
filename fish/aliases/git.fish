# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
if which hub > /dev/null
  alias git=(which hub)
end

# if not set -q git_abbrs_initialized
  set -U git_abbrs_initialized

  abbr g 'git'

  abbr ga 'git add'
  abbr gaa 'git add -A'
  abbr gacp 'git add -A; and git-amend; and git push origin +(git rev-parse --abbrev-ref HEAD)'
  abbr gap 'git add -p'

  abbr gb 'git branch'
  abbr gbd 'git branch -D'
  abbr gbm 'git branch -m'

  abbr gbl 'git blame'

  abbr gc 'git commit'
  abbr gcm 'git commit -m'
  abbr gca 'git-amend'

  abbr go 'git checkout'
  abbr gob 'git checkout -b'
  abbr gom 'git checkout main'

  abbr gcp 'git cherry-pick'

  abbr gd 'git diff --color-words'
  abbr gds 'git diff --color-words --staged'

  abbr gf 'git fetch'
  abbr gl 'git log'
  abbr gm 'git merge'

  abbr gpo 'git push origin (git rev-parse --abbrev-ref HEAD)'
  abbr gpo+ "git push origin +(git rev-parse --abbrev-ref HEAD)"
  abbr gpod 'git push origin dev'
  abbr gpom 'git push origin main'
  abbr gpo+d 'git push origin +dev'
  abbr gpo+m 'git push origin +main'

  abbr gpl 'git pull'
  abbr gplb 'git pull (git rev-parse --abbrev-ref HEAD)'
  abbr gpld 'git pull origin dev'
  abbr gplm 'git pull origin main'
  abbr gplmm 'git pull origin main'

  abbr gplr 'git pull --rebase'
  abbr gplrd 'git pull --rebase origin dev'
  abbr gplrq 'git pull --rebase origin qa'
  abbr gplrm 'git pull --rebase origin main'

  abbr gr 'git reset'
  abbr grbi 'git rebase -i HEAD~'
  abbr grba 'git rebase --abort'
  abbr grbc 'git rebase --continue'
  abbr gs 'git status -sb'

  abbr gst 'git stash'
  abbr gstp 'git stash pop'
  abbr gstl 'git stash list'

  echo 'Done'
# end

# Log / status
alias gh="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
