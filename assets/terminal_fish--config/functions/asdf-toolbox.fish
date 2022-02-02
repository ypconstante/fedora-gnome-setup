function asdf-toolbox
    set SCRIPT "source ~/.profile; asdf $argv"

    toolbox run -c "$TOOLBOX_CONTAINER" bash -c "$SCRIPT"

    podman container stop "$TOOLBOX_CONTAINER" 1> /dev/null
end
