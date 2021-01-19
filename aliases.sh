# Custom alias
alias cp='cp -v'

# Git alias
alias gtg='git tag -l -n'

# macOS alias
if [ `uname` = "Darwin" ]; then
    alias tree='tree -NC --dirsfirst'
fi

# Pyenv
export PATH="$PYENV_ROOT/shims:$PATH"
