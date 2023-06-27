# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt

if [ -f ~/.bash-aliases ]; then
    . ~/.bash-aliases

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
fi

# Enable the python startup file at ~/.pystartup
export PYTHONSTARTUP=$HOME/.pystartup

# Set my default text editor
export EDITOR=vim
export VISUAL=vim

# Set location for the trash bin
export TRASH=$HOME/.local/share/Trash

# Disable system bell
bind 'set bell-style none'

# enable better globbing
shopt -s globstar
shopt -s extglob

