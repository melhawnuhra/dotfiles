function openpr -d 'prompt to ask to open a pull request'
    set github_url (git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/')
    set branch_name (git symbolic-ref HEAD | cut -d"/" -f 3,4)
    set pr_url "$github_url/compare/main...$branch_name"
    open $pr_url
end

function gopr -d 'typecheck, lint, push current branch and open a pull request'
  pnpm typecheck
  if test $status -ne 0
    return
  end

  pnpm lint
  if test $status -ne 0
    return
  end

  git push origin (git rev-parse --abbrev-ref HEAD)
  if test $status -ne 0
    return
  end

  openpr
end