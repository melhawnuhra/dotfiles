function bak -d 'backup(copy) a file from abc to abc.bak'
    set ori $argv[1]
    if test "/" = (echo (string sub --start=-1 $argv[1])) # for dir ending with "/"
        set ori (echo (string split -r -m1 / $argv[1])[1])
    end
    cp -v $ori{,.bak}
end
function bakm -d 'backup(move) a file from abc to abc.bak'
    set ori $argv[1]
    if test "/" = (echo (string sub --start=-1 $argv[1])) # for dir ending with "/"
        set ori (echo (string split -r -m1 / $argv[1])[1])
    end
    if test -d $ori.bak
        echo The destination is alread existed.
    else
        mv -v $ori{,.bak}
    end
end
function bakr -d 'copy backup file from abc.bak to abc'
    if test -d (echo (string split -r -m1 . $argv[1])[1])
        echo The destination is alread existed.
    else
        cp -v $argv[1] (echo (string split -r -m1 . $argv[1])[1])
    end
end
function bakrm -d 'move backup file from abc.bak to abc'
    if test -d (echo (string split -r -m1 . $argv[1])[1])
        echo The destination is alread existed.
    else
        mv -v $argv[1] (echo (string split -r -m1 . $argv[1])[1])
    end
end
