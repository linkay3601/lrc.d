# source rc.d/bashrc
if [ -f "$HOME/.rc.d/bashrc" ]; then
    source $HOME/.rc.d/bashrc
fi

# source aliases.sh
if [ -f "$HOME/.lrd.d/aliases.sh" ]; then
    source $HOME/.lrd.d/aliases.sh
fi

# source functions.sh
if [ -f "$HOME/.lrd.d/functions.sh" ]; then
    source $HOME/.lrd.d/functions.sh
fi
