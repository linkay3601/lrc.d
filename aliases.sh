export GREP_COLOR='1;31'
export LC_ALL="zh_CN.UTF-8"

if [ `uname` = "Darwin" ]; then
    export PATH="/usr/local/sbin:$PATH"
fi

if [ -d $HOME/.local/bin ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Custom alias
alias l='ls -Clho'
alias ll='ls -ClhF'
alias la='ls -A'
alias lla='ls -ClhFA'
alias rs='rsync -crvzpP --exclude={.git,.venv,.DS_Store,__pycache__}'
alias httpserver='python -m http.server'
alias httpserver2='python -m SimpleHTTPServer'
alias grep='grep -I --color=auto --exclude-dir={.git,.venv}'
alias psgrep='ps ax|grep -v grep|grep'
alias tree='tree -N -C --dirsfirst'
alias less='less -N'
alias axel='axel -n 30'
alias ping='ping -i 0.1 -c 30'
alias ip4="ifconfig | grep -w inet | awk '{print \$2}'| sort"
alias ip6="ifconfig | grep -w inet6 | awk '{print \$2}'| sort"
alias tailf='tail -F'

alias cp='cp -v'
alias v="vim -Nu $HOME/.lrc.d/vimrc"
alias pping='nc -v -z -w2'
alias toc='gh-md-toc -'

# macOS alias
if [ `uname` = "Darwin" ]; then
    export HOMEBREW_NO_AUTO_UPDATE=true  # disable homebrew auto update
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.aliyun.com/homebrew/homebrew-bottles"
    alias rmds='find . -type f -name .DS_Store -delete'
    alias power="echo Power: $(pmset -g batt|awk 'NR==2{print $3}'|sed 's/;//g')"

    alias typora='open -a typora'
    alias chrome='open -a "Google Chrome"'
    alias safari='open -a "Safari"'
    alias sublime='open -a "Sublime Text"'
fi

# Python alias
alias py='python'
alias py2='python2'
alias py3='python3'
alias ipy='ipython'
alias ipy2='ipython2'
alias ipy3='ipython3'
alias venv='python -m venv'
alias virtualenv='python -m venv'
alias jpy='jupyter notebook'
alias pep='pycodestyle --ignore=E501'
alias rmpyc='find . | grep -wE "py[co]|__pycache__" | xargs rm -rvf'
alias pygrep='grep --include="*.py"'
if [[ $plugins =~ 'pip' ]]; then
    unalias pip
fi

# Git alias
alias gst='git status -sb'
alias gdf='git difftool'
alias glg='git log --stat --graph --max-count=10'
alias gco='git checkout'
alias gmg='git merge --no-commit --squash'

alias gtg='git tag --list -n'

# brew
if command -v brew >/dev/null 2>&1; then
    # BREWHOME=`brew --prefix`
    BREWHOME="/usr/local"
    export LDFLAGS="-L$BREWHOME/lib"
    export CPPFLAGS="-I$BREWHOME/include"
    export PKG_CONFIG_PATH="$BREWHOME/lib/pkgconfig"
fi

# Golang env
if command -v go >/dev/null 2>&1; then
    export GOPATH="$HOME/src/go"
    export PATH="$GOPATH/bin:$PATH"
fi

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null 2>&1; then
    # eval "$(pyenv init -)";
    # eval "$(pyenv virtualenv-init -)"
    # pyenv alias
    alias pyv='pyenv versions'
    alias chpy='pyenv global'
    alias chlpy='pyenv local'
    alias chgpy='pyenv global'

    export PATH="$PYENV_ROOT/shims:$PATH"
fi
