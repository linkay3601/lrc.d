# Custom alias
alias cp='cp -v'
alias dev="vim -Nu $HOME/.lrc.d/vimrc"

# Git alias
alias gtg='git tag -n'

# macOS alias
if [ `uname` = "Darwin" ]; then
    alias typora='open -a typora'
fi

# Pyenv
export PATH="$PYENV_ROOT/shims:$PATH"
