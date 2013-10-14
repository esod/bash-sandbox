# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.0-9

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file
# pick a random prompt
# function RANDOM_PROMPT {
# shuf -n 1 ~/random_prompt
# }

#Terminal preferences
#print '755' or '644' style permissions in terminal
alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
#Turn on color when listing directories
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PERL5LIB=/Users/matt/Scripts/perl:/Users/matt/Scripts/perl/modules:/Users/matt

# Perl configruation
# each time a perl or bash script is added, we'll create a bash alias for it
perl /Users/matt/Scripts/perl/private/generate_perl_aliases.pl
perl /Users/matt/Scripts/perl/private/generate_bash_aliases.pl
source ~/.auto_perl_aliases
source ~/.auto_bash_aliases
source ~/.auto_php_aliases
source ~/.auto_casper_aliases
source ~/.git_aliases
source ~/Misc/git-autocomplete.bash

function perl-init {
    perl /Users/matt/Scripts/perl/private/perl-init.pl $1;
    source ~/.auto_perl_aliases;
}

function bash-init {
    perl /Users/matt/Scripts/perl/private/bash-init.pl $1;
    source ~/.auto_bash_aliases;
}

function php-init {
    perl /Users/matt/Scripts/perl/private/php-init.pl $1;
    source ~/.auto_php_aliases;
}

# Path Modifications
export PATH=$PATH:/Applications/acquia-drupal/drush:/usr/bin:/Users/matt/pear/bin/:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/Users/matt/Scripts/Perl
# Using the native mac mysql.  To use acquia dev desktop use /Applications/acquia-drupal/mysql/bin/

#Shortcuts to commonly used directories
alias a="cd /Users/matt/Sites/opsumit"
alias b="cd /Users/matt/Sites/UMG"
alias c="cd /Users/matt/Sites/breakfastproject"
alias d="cd /Users/matt/Sites/nbcsports"
alias e="cd /Users/matt/Sites/git-production/sites/default"
alias vhosts="sublime /etc/apache2/extra/httpd-vhosts.conf"
alias hosts="sublime /etc/hosts"

#Meta: alias to reload this file
alias s="source ~/.bash_profile"

# showing git branches in bash prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local      YELLOW="\[\033[0;33  m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local LIGHT_PURPLE="\[\033[1;34m\]"
  local BLACK="\[\033[0;30m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac
 
PS1="${TITLEBAR}\
$YELLOW\w$LIGHT_GREEN \$(parse_git_branch)\
\n$WHITE \$ "
PS2='> '
PS4='+ '
}
proml


# Set user-defined locale
# export LANG=$(locale -uU)

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

##
# Your previous /Users/matt/.bash_profile file was backed up as /Users/matt/.bash_profile.macports-saved_2013-02-03_at_00:54:50
##

# MacPorts Installer addition on 2013-02-03_at_00:54:50: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$PATH:/Applications/acquia-drupal/drush"
