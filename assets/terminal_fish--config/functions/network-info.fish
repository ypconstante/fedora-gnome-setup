function network-info 
    argparse speedtest -- $argv

    set log_file /tmp/network-info


    _echo_title_no_lf "private ip"
    ip -brief -color address | grep --color=NEVER "UP" | tr -s ' ' | cut -d' ' -f3-

    _echo_title "resolvectl status"
    resolvectl status
    echo ""


    _echo_title_no_lf "ping by ip"
    if ping -c 1 -W 2 1.1.1.1 > $log_file || ping -c 1 -W 2 9.9.9.9 > $log_file
        _echo_ok
    else
        _echo_error
        cat $log_file
        echo ""
    end

    _echo_title_no_lf "resolve dns"
    if resolvectl query icanhazip.com > $log_file || resolvectl query archlinux.org
        _echo_ok
    else
        _echo_error
        cat $log_file
        echo ""
    end

    _echo_title_no_lf "ping by url"
    if ping -c 1 -W 3 icanhazip.com > $log_file || ping -c 1 -W 3 archlinux.org > $log_file
        _echo_ok
    else
        _echo_error
        cat $log_file
        echo ""
    end

    _echo_title_no_lf "public ip"
    curl -4 -s icanhazip.com || curl -6 icanhazip.com

    if set -q _flag_speedtest
        echo ""
        _echo_title "speed test"
        speedtest-cli --secure --simple
    end

    true
end



function _echo_green
    set_color green
    echo $argv
    set_color normal
end

function _echo_red
    set_color red
    echo $argv
    set_color normal
end

function _echo_title_no_lf
    set_color --bold cyan
    echo -ns $argv ": "
    set_color normal
end

function _echo_title
   set_color --bold cyan
    echo $argv
    set_color normal
end

function _echo_ok
    _echo_green "ok"
end

function _echo_error
    _echo_red "error"
end
