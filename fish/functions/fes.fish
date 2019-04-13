function fes -d 'Fuzzy-find staged files in the current project and edit'
  command git status -sb | sed -ne 's/^M  //p' | fzf -m | read -l result; and e "$result"
end
