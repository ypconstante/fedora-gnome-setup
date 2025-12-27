function __fedora_setup.init
    function __fedora_setup.aliases
        alias -s copy="wl-copy"

        # git
        abbr -ag g- 'git switch -'
        abbr -ag gcls git clone --depth 1 --shallow-submodules
    end

    function __fedora_setup.theme
        set -U fish_greeting

        # colors from darcula and monokai
        set -l foreground f8f8f2
        set -l selection 44475a
        set -l comment 9e9c8b
        set -l red ff6188
        set -l orange fd971f
        set -l yellow ffd866
        set -l green a9dc76
        set -l purple ab9df2
        set -l cyan 78dce8

        # Syntax Highlighting Colors
        set -U fish_color_normal $foreground
        set -U fish_color_command $green
        set -U fish_color_keyword $purple
        set -U fish_color_quote $yellow
        set -U fish_color_redirection $foreground
        set -U fish_color_end $orange
        set -U fish_color_error $red
        set -U fish_color_param $cyan
        set -U fish_color_comment $comment
        set -U fish_color_selection --background=$selection
        set -U fish_color_search_match --background=$selection
        set -U fish_color_operator $green
        set -U fish_color_escape $purple
        set -U fish_color_autosuggestion $comment

        # Completion Pager Colors
        set -U fish_pager_color_progress $comment
        set -U fish_pager_color_prefix $cyan
        set -U fish_pager_color_completion $foreground
        set -U fish_pager_color_description $comment

        # prompt config
        set -U pure_enable_container_detection false
        set -U pure_enable_single_line_prompt true
        set -U pure_color_danger $red
        set -U pure_color_info $cyan
        set -U pure_color_light $foreground
        set -U pure_color_mute $comment
        set -U pure_color_git_branch $orange
        set -U pure_color_normal $foreground
        set -U pure_color_primary $cyan
        set -U pure_color_success $green
        set -U pure_color_warning $yellow
    end

    function __fedora_setup.plugins
        # jethrokuan/z
        set -U Z_CMD "j"
        set -U Z_OWNER (whoami)
    end

    __fedora_setup.aliases
    __fedora_setup.theme
    __fedora_setup.plugins


  functions -e __fedora_setup.aliases
  functions -e __fedora_setup.theme
  functions -e __fedora_setup.plugins
end
