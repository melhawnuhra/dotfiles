function fo -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | fzf-tmux | read -l result; and git checkout "$result"
end
