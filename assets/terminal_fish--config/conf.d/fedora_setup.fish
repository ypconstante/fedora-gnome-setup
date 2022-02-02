function __fedora_setup_install --on-event fedora_setup_install
   __fedora_setup.init
end

function __fedora_setup_update --on-event fedora_setup_update
   __fedora_setup.init
end

function __fedora_setup_uninstall --on-event fedora_setup_uninstall
end
