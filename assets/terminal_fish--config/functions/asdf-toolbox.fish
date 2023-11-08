function asdf-toolbox
    set SCRIPT "source $ASDF_DIR/asdf.sh; asdf $argv"

    toolbox run -c "$TOOLBOX_CONTAINER" bash -c "$SCRIPT"

    podman container stop "$TOOLBOX_CONTAINER" 1> /dev/null
end
