# source rc.d/zshrc
if [ -f "$HOME/.rc.d/zshrc" ]; then
    source $HOME/.rc.d/zshrc
fi

# source aliases.sh
if [ -f "$HOME/.lrc.d/aliases.sh" ]; then
    source $HOME/.lrc.d/aliases.sh
fi

# source functions.sh
if [ -f "$HOME/.lrc.d/functions.sh" ]; then
    source $HOME/.lrc.d/functions.sh
fi
