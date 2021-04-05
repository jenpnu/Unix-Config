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
if [ ${uname} = "Linux" ]; then
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
export PS1="%B%F{red}%T %F{cyan}%n%f@%F{white}%m%F{blue}(${ip_str})%b%F{green}[%~]%f %# "

