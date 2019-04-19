function fem -d 'Fuzzy-find edited files in the current project and edit'
  command git status -sb | sed -ne 's/^ M //p' | fzf-tmux -m | read -l result; and e "$result"
end
