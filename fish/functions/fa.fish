function fa -d 'Fuzzy-find edited files in the current project and add'
  command git status -sb | sed -ne 's/^ M //p' | fzf -m | read -l result; and git add "$result"
end
