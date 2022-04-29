# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Fix for Libreoffice -- enable support for scim
export OOO_FORCE_DESKTOP=gnome
export XMODIFIER='@im=SCIM'
export GTK_IM_MODULE="scim"
export QT_IM_MODULE="scim"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

color_prompt=yes
force_color_prompt=yes
USER_COLOR='0;32m'

# If I'm root, set USER_COLOR to bright red
if [ ${UID} -eq 0 ]; then
    USER_COLOR='0;31m'
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[${USER_COLOR}\]\u@\h:\[\e[m\]\[\e[0;37m\]\w\[\e[0;32m\]\[\e[${USER_COLOR}\]\$\[\e[m\] \[\e[m\]\[\e[m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#
if [ -f ~/.bash-aliases ]; then
    . ~/.bash-aliases
fi

# Set local configuration (not version controlled)
if [ -f ~/.local_bashrc ]; then
    . ~/.local_bashrc
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Enable the python startup file at ~/.pystartup
export PYTHONSTARTUP=$HOME/.pystartup

# Set my default text editor
export EDITOR=vim
export VISUAL=vim

# Set default editor for Subversion
export SVN_EDITOR=vim

# Set location for the trash bin
export TRASH=$HOME/.local/share/Trash

# Set location for Wine's C drive
export DRIVE_C=$HOME/.wine/drive_c

# Sends a file or folder to the trash. rm is aliased to this function
# send_to_trash() { mv $1 $TRASH; }
# delete_now() { rm -I $1; }

# Disable system bell in Xorg
if [ -n "$DISPLAY" ]; then
    xset b off
fi

# enable better globbing
shopt -s globstar
shopt -s extglob

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
