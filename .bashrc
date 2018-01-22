#
#~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[01;32m\]$(__git_ps1 "[%s]")\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W$(__git_ps1 "[%s]")\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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
alias la='ls -lAh'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#nvim
export VTE_VERSION="100"

#local binaries
export PATH=/home/miquel/.local/bin:$PATH

#colored xterm
export TERM=xterm-256color

#uncrustify
export UNCRUSTIFY_CONFIG=~/.uncrustify_config

# Enable ccache to speed up compilation time
export PATH=/usr/lib/ccache:$PATH
export PATH=$HOME/bin:$PATH
export CCACHE_DIR=$HOME/.ccache
export CCACHE_TEMPDIR=$HOME/.ccache

#ROS
unset ROS_MASTER_URI
unset ROS_IP
unset ROS_HOSTNAME
export ROS_PARALLEL_JOBS='-j2 -l2'
#export EDITOR=subl
export EDITOR=vi
export ROSCONSOLE_FORMAT='[${severity}]: ${message}'
export ROSLAUNCH_SSH_UNKNOWN=1

######################
# SOURCE ROS VERSION #
######################
source ~/ws/kinetic/devel/setup.bash

################
# SETUP ROS IP #
################
export ROS_IP=`ifconfig  | grep 'inet ' | grep -v '127.0.0.1' | cut -d: -f2 | awk 'END{print $1}'`
if [[ -z "$ROS_IP" ]]; then
  export ROS_IP=127.0.0.1
fi
#export ROS_IP=192.168.1.170
#export ROS_IP=127.0.0.1


###############
# EXPERIMENTS #
###############
#export ROS_MASTER_URI=http://192.168.1.181:11311
#export ROS_MASTER_URI=http://192.168.1.180:11311
#export ROS_MASTER_URI=http://192.168.1.205:11311 # Sparus
#export ROS_MASTER_URI=http://192.168.1.207:11311 # Sparus
#export ROS_MASTER_URI=http://pul.uib.es:11311
#export ROS_MASTER_URI=http://192.168.1.100:11311
#export ROS_MASTER_URI=http://192.168.1.51:11311 # G500
#export ROS_MASTER_URI=http://192.168.1.61:11311 # S2 Girona
#export ROS_MASTER_URI=http://192.168.1.25:11411 # rompetechos

#export ROS_MASTER_URI=http://dfki-robot:11311
#export ROS_MASTER_URI=http://tno-robot:11311
#export ROS_MASTER_URI=http://192.168.1.204:11311

#turbot
