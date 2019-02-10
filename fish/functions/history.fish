# do `h` in the new one after switching terminal session
function h --on-process-exit %self
    history --merge
end
function his
    history | ag $argv[1]
end
