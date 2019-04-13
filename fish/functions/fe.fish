function fe -d "Fuzzy-find a file and edit"
  command git ls-files (git rev-parse --show-toplevel) | fzf -m | read -l result; and e "$result"
end
