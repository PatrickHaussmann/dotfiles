
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
alias du='du -ach | sort -h'
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
#alias unsplash='bash ~/dotfiles/bash/.bash_unsplash'



# Functions

# Extract a variety of compressed file types
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1    ;;
             *.tar.gz)    tar xzf $1    ;;
             *.bz2)       bunzip2 $1    ;;
             *.rar)       unrar e $1    ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1     ;;
             *.tbz2)      tar xjf $1    ;;
             *.tgz)       tar xzf $1    ;;
             *.zip)       unzip $1      ;;
             *.Z)         uncompress $1 ;;
             *.7z)        7z x $1       ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Repeat command n times, eg: repeat 5 echo hi
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do
        eval "$@";
    done
}

function picrename() {
     MY_PATH=$(readlink -nf $1)
     fdfind '.' -e jpeg "$MY_PATH" -x mv {} {.}.jpg
     exiftool -P "-filename<FileModifyDate" "-filename<DateTimeOriginal" "-filename<CreateDate" -d "%Y%m%d-%H%M%S%%-c.%%le" -ext jpg -ext png -ext nef -ext mov -ext mp4 -ext lrv -r "$MY_PATH"
     fdfind '.' -e lrv "$MY_PATH" -x mv {} {.}.lrv.mp4
}

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

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


# Prompt


# Heavily inspired by @chengbo’s prompt: https://raw.githubusercontent.com/chengbo/dotfiles/master/.bash_prompt

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM='xterm-256color';
fi;

if tput setaf 1 &> /dev/null; then
  tput sgr0; # reset colors
  bold=$(tput bold);
  reset=$(tput sgr0);
  # Solarized colors, taken from http://git.io/solarized-colors.
  black=$(tput setaf 0);
  blue=$(tput setaf 33);
  cyan=$(tput setaf 37);
  green=$(tput setaf 64);
  orange=$(tput setaf 166);
  purple=$(tput setaf 125);
  red=$(tput setaf 124);
  violet=$(tput setaf 61);
  white=$(tput setaf 15);
  yellow=$(tput setaf 136);
else
  bold='';
  reset="\e[0m";
  black="\e[1;30m";
  blue="\e[1;34m";
  cyan="\e[1;36m";
  green="\e[1;32m";
  orange="\e[1;33m";
  purple="\e[1;35m";
  red="\e[1;31m";
  violet="\e[1;35m";
  white="\e[1;37m";
  yellow="\e[1;33m";
fi;

prompt_git() {
  local s='';
  local branchName='';

  # Check if the current directory is in a Git repository.
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null;

      # Check for uncommitted changes in the index.
      if ! $(git diff --quiet --ignore-submodules --cached); then
        s+='+';
      fi;

      # Check for unstaged changes.
      if ! $(git diff-files --quiet --ignore-submodules --); then
        s+='!';
      fi;

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        s+='?';
      fi;

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        s+='$';
      fi;

    fi;

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # Otherwise, just give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
      git rev-parse --short HEAD 2> /dev/null || \
      echo '--unknown--')";

    [ -n "${s}" ] && s="[${s}]";

    echo -e " ${1}(${branchName})${2}${s}";
  else
    return;
  fi;
}

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
  userStyle="${red}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
  hostStyle="${bold}${red}";
fi;

prompt_status() {
  if [ "$?" == "0" ]; then
    echo -e "${green}";
  else
    echo -e "${red}";
  fi
}


export -f prompt_git

# Set the terminal title to the current working directory.
PS1="\[\$(prompt_status)\]→ \[${reset}\]";
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${white}\]@";
PS1+="\[${hostStyle}\]\h\[${reset}\]"; # host
PS1+="\[${white}\]:";
PS1+="\[${bold}${green}\]\w\[${reset}\]"; # working directory
# Git repository details with 1 second timeout (for slow networks or filesystems)
PS1+="\$(timeout 1 bash -c 'prompt_git \"\[${violet}\]\" \"\[${blue}\]\"')"; 
PS1+="\[${white}\]\$\[${reset}\] "; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;

# End of Prompt


