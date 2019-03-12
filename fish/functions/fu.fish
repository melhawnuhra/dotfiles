function fu -d 'fu command and prompt to ask to open it or not'
    type $argv
    if test $status != 0
        return
    end
    echo
    set -l result (type $argv)
    # check if the argv is a definition in config.fish
    printf '%s\n' $result | head -1 | grep -i "is a function with definition" ^/dev/null >/dev/null
    if test $status = 0
        read -n 1 -p 'echo "Open the file containing the definition? [y/N]: "' -l answer
        if test "$answer" = "y" -o "$answer" = " "
            # check if the definition is an alias or a function
            # alias    -- second line of output of fu ends with "- @ line 0"
            # function -- second line of output of fu ends with "$path @ line $num_line"
            set -l num_line (printf '%s\n' $result | sed -n "2p" | awk -v x=7 '{print $x}')
            # or
            # set -l num_line (printf '%s\n' $result | sed -n "2p" | awk 'NF>1{print $NF}')
            set -l def_file (printf '%s\n' $result | sed -n "2p" | awk -v x=4 '{print $x}')
            if test $def_file = "-"
                set def_file ~/.config/fish/config.fish
                set -l argv_line (printf "alias %s " $argv)
                set num_line (grep -n $argv_line $def_file | cut -d: -f1)
            end
            e $def_file +$num_line
        end
    else if test (printf '%s\n' $result | head -1 | grep -i "is a builtin")
        return                  # is a builtin like if
    else # argv is a file
        set -l file_path (printf '%s\n' $result | awk 'NF>1{print $NF}')
        # symbolic
        file $file_path | grep "symbolic"
        if test $status = 0
            # the file_path may only contains the file name if target is in the same dir
            set file_path (readlink -f $file_path)
        end
        # script
        file $file_path | grep "script"
        if test $status = 0
            echo
            read -n 1 -p 'echo "Open the file?[y/N]: "' -l answer
            if test "$answer" = "y" -o "$answer" = " "
                e $file_path
            end
        else
            file $file_path
        end
    end
end
