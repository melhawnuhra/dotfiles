function gopr -d 'prompt to ask to open a Pull Request'
    set github_url (git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/')
    set branch_name (git symbolic-ref HEAD | cut -d"/" -f 3,4)
    set pr_url "$github_url/compare/main...$branch_name"
    open $pr_url
end