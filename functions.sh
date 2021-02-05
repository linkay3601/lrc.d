# Proxy
proxy() {
    if [ -z "$ALL_PROXY" ]; then
        if [[ $1 == "-s" ]]; then
            export ALL_PROXY="socks5://127.0.0.1:1086"
        else
            export ALL_PROXY="http://127.0.0.1:1087"
        fi
        printf "Proxy on: $ALL_PROXY\n";
    else
        unset ALL_PROXY;
        printf 'Proxy off\n';
    fi
}

# kill tmux's session
tkill() {
    if [[ "$1" == "-a" ]]; then
        tmux kill-session -a
    else
        for target in $@
        do
            if tmux kill-session -t $target; then
                echo "Tmux session $target has been killed"
            fi
        done
    fi
}

