# I do this almost every time I 'cd' anyway
function cd -d 'ls immediately after changing directory'
    if count $argv > /dev/null
        builtin cd "$argv"; and ls
    else
        builtin cd ~; and ls
    end
end

