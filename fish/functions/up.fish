function up -d "cd to a parent folder with fuzzy matching"
  if test (count $argv) -eq 0
    echo "up: traverses up the current working directory to first match and cds to it"
    echo "Missing argument"
  else
    cd (_up "$argv")
  end
end
