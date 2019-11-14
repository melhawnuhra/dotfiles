function clip -d "Copy file or STDIN to clipboard"
  set -l ftype (file "$argv"|grep -c 'text')
  if test $ftype -eq 1
      command cat "$argv" | ~/scripts/rpbcopy;
      echo "Contents of $argv are in the clipboard.";
  else
      echo "File \"$argv\" is not plain text.";
  end
end
