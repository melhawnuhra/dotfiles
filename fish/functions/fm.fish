function fm -d 'Fuzzy-find branches in the current repo to merge'
  git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git merge "$result"
end
