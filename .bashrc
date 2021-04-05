# Reset PATH if it is in tmux
if [ -n "$TMUX" ]; then
  PATH=${PATH_ORI}
  CLASSPATH=${CLASSPATH_ORI}
fi
export PATH_ORI=${PATH}
export CLASSPATH_ORI=${CLASSPATH}
export TERM=screen-256color
export CLICOLOR=1

# alias
alias ls='ls -GFh'
alias ll='ls -l'
alias tmr='tmux attach 2>/dev/null || tmux'
alias sr='screen -RD'

# prompt
## Platform-dependent settings
uname=`uname`
if [ ${uname} == "Linux" ]; then
  alias ls='ls --color=auto'
  first_ip=`ip addr | sed -e '/127\.0\.0\.1/d' | awk '/inet .*/{print $2}' | sed 1q | awk -F/ '{print $1}'`
else
  export LSCOLORS=dxfxcxdxbxegedabagacad
  alias ls='ls -G'
  first_ip=`ifconfig | sed -e '/127\.0\.0\.1/d' | awk '/inet .* netmask/{print $2}' | sed 1q | sed -n '1,1p'`
fi

if [ -n "${PS1}" ]; then
  ip_str='N/A'
  if [ -n "${first_ip}" ]; then
    ip_str=${first_ip}
  fi  
fi

## color
cyan="\[\033[1;36m\]"
blue="\[\033[1;34m\]"
pink="\[\033[1;31m\]"
green="\[\033[0;32m\]"
white="\[\033[1;37m\]"
purple="\[\033[1;35m\]"
default="\[\033[0m\]"
export PS1="${pink}\A ${cyan}\u${default}@$white\h${blue}(${ip_str})${green}[\w]${default} \\$ "

