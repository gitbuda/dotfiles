# General
alias bash_reload="source ~/.bashrc"
alias cwdir="rm -r ./*"
alias directory_size='du -sh'
alias o="xdg-open"
alias rpyc="find . -name '*.pyc' -delete"
alias rswo="find . -name '*.swo' -delete"
alias rswp="find . -name '*.swp' -delete"
alias rtild="find . -name '*~' -delete"
alias rall="rpyc && rswo && rswp && rtild"
alias rnpm="rm -rf node_modules"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias makej="make -j$(nproc)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias makej="make -j$(sysctl -n hw.physicalcpu)"
else
  echo "Unable to define makej alias because unknown OS"
fi
alias cmaked="cmake -DCMAKE_BUILD_TYPE=Debug .."
alias cmaker="cmake -DCMAKE_BUILD_TYPE=Release .."
alias cmakerd="cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .."

# Git
alias ga="git add"

# Docker
alias dk="docker"
alias dkpc="docker container prune"
alias dkpi="docker images prune"
alias dkc="docker-compose"

# Virtualenv
alias ave3="source ve3/bin/activate"
alias sve3="virtualenv -p python3 ve3"
alias amg4="source /opt/toolchain-v4/activate"

# Antlr
alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

# Tmux
alias ta="tmux attach"
alias tat="tmux attach -t"
alias tl="tmux list-session"

# Python
alias pypipi="pip install -r"
alias pysetupi="python setup.py install"

# Frontend development
alias ng-local="npx -p @angular/cli ng"

# fzf
alias fzfp="fzf --preview='batcat --color=always {}'"

# CMake
alias lscmake="cmake --build . --target help"

# Memgraph
alias fire="sudo runuser -l memgraph -c '/usr/lib/memgraph/memgraph --also-log-to-stderr'"
alias fired="docker run -it --rm -p 7687:7687 memgraph --telemetry-enabled=False --also-log-to-stderr --log-level=TRACE"
alias mgactivate="source /opt/toolchain-v4/activate"
