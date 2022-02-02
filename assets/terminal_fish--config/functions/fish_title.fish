# https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_title.fish
# https://gist.github.com/klazuka/cf516db5eab564704527

function fish_title
    set -l current_command (echo $_)

    set -l pwd ''
    set -l git_dir (git rev-parse --show-toplevel 2> /dev/null)

    if test -n "$git_dir"
        # we are inside a git directory, so use the name of the repo as the terminal title

        if test $git_dir = "$PWD"
            # we are at the root of the git repo
            set pwd (basename $git_dir)
        else
            # we are at least one level deep in the git repo
            set -l parent_dir (dirname $git_dir)
            set -l pwd_parts (string match -r "$parent_dir/(.*|\$)" "$PWD")

            set pwd  "$pwd_parts[2]"
        end
    else
        set pwd $PWD
        set -l pwd_parts (string match -r "$HOME(/.*|\$)" "$pwd")
        if set -q pwd_parts[2]
            set pwd "~$pwd_parts[2]"
        end
    end

    if test $current_command = "fish"
        echo $pwd
    else if not set -q INSIDE_EMACS; or string match -vq '*,term:*' -- $INSIDE_EMACS
        echo (set -q argv[1] && echo $argv[1] || status current-command) $pwd
    end
end
