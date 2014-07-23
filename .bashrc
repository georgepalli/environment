#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 
# BASHRC
# George Abraham
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~# 


# --------
# SET VARS
# Prefix with m_ to prevent conflicts  in various environments
# --------

export m_HOST_NAME=`hostname -s`
export m_ARCH=`uname -s`
export m_ME=`whoami`
#export LESS='-IcQsMPM-less-?f(%f).--?e(END):?pb%pb\%..'


# --------------------
# ARCH BASED SETTINGS
# --------------------
if [[ $m_ARCH == "Darwin" ]] ; 
then
  export m_HOMEROOT="/Users"
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
elif [[ $m_ARCH == "Linux" ]]
then
  export m_HOMEROOT="/home"
fi

#--------
# ALWAYS
#--------
export EDITOR=vim
set -o vi

# Dir permissions set to 775 and file permissions are 664
umask 002

# Tab complete ssh known hosts
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# ---------
# SOURCERY!
# ---------

# Global definitions if not dev environment
if [[ -f /etc/bashrc && $m_HOST_NAME != *${USER}* ]]; then
 . /etc/bashrc
fi

# For git bash completion
# brew bash completion packages
if [[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

if [[ -f /usr/local/etc/bash_completion ]]; then
  # Source completion code
  . /usr/local/etc/bash_completion  2>/dev/null
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

#if [[ -f ~/.bash-git-prompt/gitprompt.sh ]]; then
#  export GIT_PROMPT_ONLY_IN_REPO=1
#  . ~/.bash-git-prompt/gitprompt.sh -- too slow
#fi

if [[ -f ~/.bashrc_more ]]; then
  # More options
  . ~/.bashrc_more 2>/dev/null
fi

if [[ -f ~/.aliases ]]; then
  # Aliases
  . ~/.aliases 
fi

if [[ -f ~/.funcs ]]; then
  # Functions
  . ~/.funcs
fi

if [[ -f ~/.workrc ]]; then
  # Work specific settings
  . ~/.workrc
fi


# -------
# PROMPT
# -------
if [[ $m_HOST_NAME == *$USER* ]] ; then

  # Git based prompt for dev environment
export PROMPT_COMMAND='\
  BRANCH="";\
  if git branch 2>/dev/null 1>/dev/null; then\
    BRANCH=$(git branch 2>/dev/null | grep \* |  cut -d " " -f 2) ;\
    if [[ "x$BRANCH" != "x" ]] ; then
      BRANCH="[ ${BRANCH} ]"
    fi;
  fi;
PS1="\[\e[0;36m\]\w \e[0;32m\]${BRANCH} \n\e[0;31m\]\u\e[0;33m\]@\e[0;31m\][\e[0;33m\]$m_HOST_NAME\e[0;31m\]]\n\[\e[0;33m\][\!]\[\e[0m\]>";
'
fi


