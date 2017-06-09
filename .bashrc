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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

#if [ "$color_prompt" = yes ]; then
#   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#   ;;
#*)
#   ;;
#esac

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi





#----- def ------
PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32;1m\]\h\[\033[0;32;1m\]\[\033[1;33;1m\]::\[\033[1;32;1m\]\u:\[\033[4;36;1m\]\w\[\033[0;34;1m\]\$'
alias cp="cp "
alias less="less "
alias cat="cat "
export PATH="${PATH}:"
##------ anchor system begin------
_M_=("$HOME/Documents" ~/Documents/C++ ~/Documents/PHP ~/Documents/Shell /opt/lampp/htdocs /etc/ ~/Downloads/xmind-8-update2-linux/XMind_amd64 8 9 )
ri=0
for d_P in ${_M_[*]}
do
    alias r"`expr ${ri} + 1`"='_M_['"${ri}"']=`pwd`;_M_['"${ri}"']="${_M_['"${ri}"']}" '
    alias g"`expr ${ri} + 1`"='cd ''"${_M_['"${ri}"']}"'
    alias w"`expr ${ri} + 1`"='echo "${_M_['"${ri}"']}" '
    ri=`expr ${ri} + 1`
done
_M_BACK=`pwd`
_M_TMP=""
alias Xrecordcurrentdir__='_M_TMP=$_M_BACK;_M_BACK=`pwd`'
alias b='cd "$_M_TMP" '
alias u='cd .. '
alias w='ri=0;while(($ri<9)); do echo g`expr ${ri} + 1`:"${_M_[${ri}]}";let ri++; done'
alias h="cd ~"
alias l="cd /"
alias cd='Xrecordcurrentdir__;cd '
alias sudo="sudo env PATH=${PATH} "
##------ anchor system end------ 
##------ fast operation begin------
alias p="python "
alias m="make "
alias mc="make clean "
alias preview="g++ -std=c++11 -E "
alias withtemplatesdebug="preview drive.cpp > tmp.cpp;g++ -std=c++11 tmp.cpp   -o drive"
alias t="./drive"
alias n="nautilus . "
alias sa="/opt/lampp/xampp startapache "
alias ea="/opt/lampp/xampp stopapache "
alias sq="/opt/lampp/xampp startmysql "
alias eq="/opt/lampp/xampp stopmysql "
##------ fast operation end------
##---- tools cmd begin-----
alias refrwlpp="bash /opt/tools/Refresh.sh "
alias mkdynwlpp="bash /opt/tools/AddDynamicWallPapers.sh "
alias rmex="bash /opt/tools/rmex.sh "
alias cpfile="bash /opt/tools/cpfile.sh "
alias dropfile="bash /opt/tools/dropfile.sh "
alias rmmatch="bash /opt/tools/rmmatch.sh "
alias webpageadd="bash /opt/tools/webpageadd.sh "
##---- tools cmd end-----
##---- internet cmd begin-----
alias web="nohup google-chrome 1>/dev/null 2>/dev/null &"
alias sweb="nohup google-chrome --incognito 1>/dev/null 2>/dev/null &"
alias videomod="cd /opt/finalspeed_client/ ;sudo bash -c 'nohup java -jar /opt/finalspeed_client/finalspeed_client.jar  1>/var/log/finalspeed/finalspeed.log 2>/var/log/finalspeed/finalspeed_err.log &' "
alias usinghosts="cat /etc/hosts_backup|sudo tee -a /etc/hosts >> /dev/null"
alias nohosts="sudo cp /etc/hosts_old /etc/hosts"
alias chkhosts="cat /etc/hosts"
alias chkwebpages="ls /opt/lampp/htdocs/"
alias changeip_forward="sudo subl /proc/sys/net/ipv4/ip_forward "
alias peepit="bash /opt/tools/peepit.sh "
alias scan_wifi="sudo iw dev wlo1 scan|less"
#internet cmd end-----
#----- def ----
