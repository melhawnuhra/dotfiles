function fo -d "Fuzzy-find and checkout a branch"
  # git branch --sort='authordate:iso8601' --format=' %(authordate:relative)%09%(refname:short)' | tac | fzf-tmux | read -l result; and git checkout "$result"
  git branch --sort='authordate:iso8601' --format=' %(authordate:relative)%09%(refname:short)' | tac | fzf-tmux |  sed 's/.*ago[[:space:]]*//' | read -l result; and git checkout "$result"
end

# function foo -d "Fuzzy-find and checkout a branch"
#   | grep -v HEAD | string trim | fzf-tmux | read -l result; and git checkout "$result"
# end
