. ~/.profile
. ~/.bashrc

if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="/usr/local/share/chruby:$PATH"

# enable tab completion for git
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

listening() {
  if [ $# -eq 0 ]; then
      sudo lsof -iTCP -sTCP:LISTEN -n -P
  elif [ $# -eq 1 ]; then
      sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
  else
      echo "Usage: listening [pattern]"
  fi
}
