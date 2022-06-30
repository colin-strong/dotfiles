# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

shopt -s histappend
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

USER_COLOR='0;30m'

# If I'm root, set USER_COLOR to bright red
if [ ${UID} -eq 0 ]; then
    USER_COLOR='0;31m'
fi

PS1='\[\e[${USER_COLOR}\]\u\[\e[0;30m\]@\[\e[0;30m\]\h\[\e[0m\]:\[\e[0;38;5;16m\]\W\[\e[0m\]$ \[\e[0m\]'

if [ -f ~/.custom_functions ]; then
    . ~/.custom_functions
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

export PYTHONSTARTUP=$HOME/.pystartup
export EDITOR=vim
export VISUAL=vim
export TRASH=$HOME/.local/share/Trash
export DRIVE_C=$HOME/.wine/drive_c

# Disable system bell in Xorg
if [ -n "$DISPLAY" ]; then
    xset b off
fi

# enable better globbing
shopt -s globstar
shopt -s extglob

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

