
# If not running interactively, stop here 
[[ $- != *i* ]] && return

# Aliases

alias ls='ls -hF --color=auto'
alias grep='grep --color=auto'
alias cp='cp -v'
alias la='ls -Al'
alias mv='mv -v'
alias mkdir='mkdir -v'
alias ll='_(){ la --color=never $* | less; }; _'

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"
alias x='exit'

alias update='sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y'
alias s='sudo'
alias sai='sudo apt install'
alias sap='sudo apt purge'
alias mkcd='_(){ mkdir $1; cd $1; }; _'
alias du2='_(){ du -ach --max-depth=1 $1 | sort -h ; }; _'
alias fhere='find . -name'
alias wget='wget -c'
alias myip='curl -s https://api64.ipify.org; echo'
alias myip4='curl -s https://api.ipify.org; echo'
alias myip6='curl -s https://api6.ipify.org; echo'

alias mosh='LC_ALL="en_US.UTF-8" mosh'
alias python='python3'
alias pip='pip3'
alias weather='curl v2.wttr.in/'

alias mirror='wget -e robots=off -mkEpnp -w 0.5 --random-wait'

which batcat &> /dev/null
if [ $? -eq 0 ]; then
  alias bat='batcat'
fi
export BAT_PAGER='less -XFRM'

alias fd='fdfind'
alias man='batman'
alias cat='bat --style=plain'
alias ls='exa --color=auto'
alias la='exa -lagF --git --color=auto'
alias ld='la -D'

dir="${HOME}/.bash.d"
if [[ -d "$dir" && -r "$dir" && -x "$dir" ]]; then
  for file in "$dir"/*; do
    [[ -f "$file" && -r "$file" ]] && source "$file"
  done
fi

export PATH="$HOME/.bin:$PATH"
export VISUAL=vim
export EDITOR="$VISUAL"
export LC_ALL="en_US.UTF-8"


PROMPT_COMMAND='history -a'

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

# Disable completion when the input buffer is empty.  i.e. Hitting tab
# and waiting a long time for bash to expand all of $PATH.
shopt -s no_empty_cmd_completion

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

