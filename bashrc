# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Add git branch if its present to PS1
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
return_emoji() {
  # Don't pollute the return value in case we use it for something else
  local _return_value="$?"
  if ((_return_value == 0)); then
    echo -n $'\U1F680' # 🚀
  else
    echo -n $'\U1F4A5' # 💥
  fi
  return "$_return_value"
}
# For some reason return emoji only works if it's at the beginning of PS1
export PS1=' $(return_emoji) '"\u@\h \[\033[32m\]\w\[\033[33m\] \$(parse_git_branch)\[\033[00m\] $ "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# Load bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
export PATH="/home/$USER/.local/ssh-ident:$PATH"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## buda setup.
__HOME_PATH="/home/$USER"
__SCRIPTS_PATH="${__HOME_PATH}/scripts"

# tmux+vim setup.
export TERM=screen-256color

# PATH extensions.
export PATH="$PATH:${__SCRIPTS_PATH}"
export PATH="$PATH:${__SCRIPTS_PATH}/workspace"
export PATH="$PATH:${__SCRIPTS_PATH}/util"
export PATH="$PATH:${__SCRIPTS_PATH}/git"

# shellcheck disable=SC1090
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
