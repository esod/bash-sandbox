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

# Perl configruation
export PERL5LIB=/Users/matt/Scripts/perl:/Users/matt/Scripts/perl/modules
# each time a perl script is added, we'll create a bash alias for it
perl /Users/matt/Scripts/perl/private/generate_perl_aliases.pl
perl /Users/matt/Scripts/perl/private/generate_bash_aliases.pl
source ~/.perl_aliases
source ~/.auto_bash_aliases
source ~/.git_aliases

function perl-init {
    perl /Users/matt/Scripts/perl/private/perl-init.pl $1;
    source ~/.perl_aliases;
}

function bash-init {
    perl /Users/matt/Scripts/perl/private/bash-init.pl $1;
    source ~/.auto_bash_aliases;
}

# Path Modifications
export PATH=$PATH:/Applications/acquia-drupal/drush:/Users/matt/pear/bin/:/Applications/acquia-drupal/mysql/bin/:/opt/local/bin:/opt/local/sbin:/Users/matt/Scripts/Perl
# Using acquia drupal mysql now, to switch back to the native "real" mysql use: /usr/local/mysql/bin/

#Shortcuts to commonly used directories
alias a="cd /Users/matt/Sites/nbcsports"
alias b="cd /Users/matt/Sites/UMG"
alias c="cd /Users/matt/Sites/nbcsports/docroot/profiles/nbcsports"
alias go:warner="cd /c/wamp/www/Warner-Common-Files/"

#Meta: alias to reload this file
alias s="source ~/.bash_profile"

# showing git branches in bash prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local      YELLOW="\[\033[0;33m\]"
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



##############################
#####CUSTOM GIT FUNCTIONS#####
##############################

#Use after a pull request has been verified as good, simultaneously deploy in upstream, origin, and dev
function deploy_everywhere {

    remotes=(
        origin
        upstream
        acquia
    )
    
    for ref in ${remotes[@]}
    do
    echo -e "\n\033[38;5;148m[Deploying in $ref]\033[39m"
    git push $ref HEAD:master;
    done
}

#Generate a new difflog and push it to github
function difflog {
    #check git status just as a reminder of uncommitted changes
    git status;

    #confirm before executing
    read -p "
    This will generate a new difflog, commit your index, and deploy_everywhere.  Continue? (y/n)  " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then

    #generate difflogs and save them to a file within the current git root
    echo -e "\n\033[38;5;148m[Writing difflogs to file]\033[39m"
    git diff --stat rsn-2.0.5-b > /Users/matt/Sites/nbcsports/library/prod_diff;
    git diff --stat acquia/rsn-stage > /Users/matt/Sites/nbcsports/library/stage_diff;

    #Commit the difflog
    echo -e "\n\033[38;5;148m[Commiting new difflogs]\033[39m"
    git commit -am 'updating difflog';

    #deploy the difflog in origin/master, acquia/master, and upstream/master
    deploy_everywhere;
    fi
}

alias guys="gbs victor/master denis/master oleksii/master alex/master mark/master sergii/master"


################################
#####CUSTOM DRUSH FUNCTIONS#####
################################

# Run drush on all local sites
function drushall {
    aliases=(
        csnbaltimore
        csnnw
        csnbayarea
        csnphilly
        nbc10
        nbcbayarea
        csnchicago
    )

    for alias in ${aliases[@]}
    do
    echo -e "\033[38;5;148m[Starting $alias local]\033[39m"
    drush @$alias.local "$@";
    done
}

# Run drush on all dev sites
function drushall_dev {
    aliases=(
        csnwashington
        csnbaltimore
        csnhouston
        csnbayarea
        csnchicago
        csnphilly
        csnne
        csnnw
        csssports
        nbcbayarea
        nbc10
    )

    for alias in ${aliases[@]}
    do
    echo -e "\033[38;5;148m[Starting $alias Dev]\033[39m"
    drush @$alias.dev "$@";
    done
}

#Run drush on all staging environments
function drushall_stage {
    aliases=(
        csnbaltimore
        csnhouston
        csnwashington
        csnbayarea
        csnphilly
        csnchicago
        csnne
        csnnw
        nbc10
        nbcbayarea
        csssports
    )

    for alias in ${aliases[@]}
    do
    echo -e "\033[38;5;148m[Starting $alias Staging 1]\033[39m"
    drush @$alias.test "$@";
    done
}

#Run drush on all hotfix environments
function drushall_hotfix {
    aliases=(
        csnbaltimore
        csnhouston
        csnwashington
        csnbayarea
    )

    for alias in ${aliases[@]}
    do
    echo -e "\033[38;5;148m[Starting $alias Hotfix]\033[39m"
    drush @$alias.hotfix "$@";
    done
}

#Run drush on all load test environments
function drushall_stage3 {
    aliases=(
        csnbaltimore
        csnhouston
        csnwashington
        csnbayarea
        csnphilly
        csnchicago
        csnne
        csnnw
        csssports
        nbc10
        nbcbayarea
    )

    for alias in ${aliases[@]}
    do
    echo -e "\033[38;5;148m[Starting $alias Staging 3]\033[39m"
    drush @$alias.stage3 "$@";
    done
}


#Run drush on all production environements
function drushall_prod {
    read -p "
    This is the live production environment, changes will be publicly visible, are you sure you wish to continue? " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
    aliases=(
        csnbaltimore
        csnhouston
        csnwashington
        csnbayarea
        csnchicago
        csnphilly
        csnnw
        nbc10
        nbcbayarea
    )

    for alias in ${aliases[@]}
    do
    echo -e "\n\033[38;5;148m[Starting $alias Prod]\033[39m"
    drush @$alias.prod "$@";
    done
    fi
}

function syncdown {
    # This will grab the database from prod, and ready it for use locally
    #
    # Usage: "syncdown [sitename]" e.g. issuing "syncdown csnbaltimore" will copy 
    #        csnbaltimore.prod to csnbaltimore.local
    #
    # Requirements:
    # 1. Matching drush aliases for local and prod.  For instance, if your local
    #    alias is "@mysite.local" your production alias should be "@mysite.prod"
    #    see http://api.drush.org/api/drush/examples!example.aliases.drushrc.php/3.x
    #    for more information on drush aliases
    # 2. ssh and rsync running locally, accessible to drush
    # 3. stage_file_proxy module.  See http://drupal.org/project/stage_file_proxy
    #    for more information on configuring this module. 
    #
    # @to-do: create the site locally if it doesn't exist.

    #Copy the database and then wait
    echo -e "\n\033[38;5;148m[copying database from $1 prod -> local, this may take up to 30 minutes]\033[39m"
    drush sql-sync -y @$1.prod @$1.local
    sleep 10

    #Set the proper files directory
    echo -e "\n\033[38;5;148m[Setting proper files directory]\033[39m"
    drush @$1.local vset file_temporary_path "/tmp/nbcsportsdev"

    #Disable update module for performance reasons
    echo -e "\n\033[38;5;148m[Disabling update module]\033[39m"
    drush @$1.local dis -y update

    #Enable stage_file_proxy, this is what gives us the images
    echo -e "\n\033[38;5;148m[Enabling stage_file_proxy]\033[39m"
    drush @$1.local en -y stage_file_proxy

    #Clear the cache
    echo -e "\n\033[38;5;148m[Clearing cache]\033[39m"
    drush @$1.local cc all
}

function settingdown {
    #the same as syncdown but without the database copy

    #Set the proper files directory
    echo -e "\n\033[38;5;148m[Setting proper files directory]\033[39m"
    drush @$1.local vset file_temporary_path "/tmp/nbcsportsdev"

    #Disable update module
    echo -e "\n\033[38;5;148m[Disabling update module]\033[39m"
    drush @$1.local dis -y update

    #Enable stage_file_proxy
    echo -e "\n\033[38;5;148m[Enabling stage_file_proxy]\033[39m"
    drush @$1.local en -y stage_file_proxy

    #Clear the cache
    echo -e "\n\033[38;5;148m[Clearing cache]\033[39m"
    drush @$1.local cc all
}


#Check roll out module schema version in system table (e.g. rsn.module, csn_baltimore_core.module)
#sql-query "SELECT schema_version FROM system WHERE filename='profiles/nbcsports/modules/custom/rsn/rsn.module'"
alias rsn_schema="drushall sql-query \"SELECT schema_version FROM system WHERE filename='profiles/nbcsports/modules/custom/rsn/rsn.module'\";"
alias rsn_schema_dev="drushall_dev sql-query \"SELECT schema_version FROM system WHERE filename='profiles/nbcsports/modules/custom/rsn/rsn.module'\";"
alias rsn_schema_stage="drushall_stage sql-query \"SELECT schema_version FROM system WHERE filename='profiles/nbcsports/modules/custom/rsn/rsn.module'\";"
alias rsn_schema_stage3="drushall_stage3 sql-query \"SELECT schema_version FROM system WHERE filename='profiles/nbcsports/modules/custom/rsn/rsn.module'\";"
alias rsn_schema_prod="drushall_prod sql-query \"SELECT schema_version FROM system WHERE filename='profiles/nbcsports/modules/custom/rsn/rsn.module'\";"
alias rsn_schema_hotfix="drushall_hotfix sql-query \"SELECT schema_version FROM system WHERE filename='profiles/nbcsports/modules/custom/rsn/rsn.module'\";"
alias list_overrides_dev="drushall_dev fd |grep 'Enabled   O'"
alias dl="drush dl --destination=/Users/matt/Sites/nbcsports/docroot/profiles/nbcsports/modules/contrib/"

##################################
######CUSTOM RSYNC FUNCTIONS######
##################################

function b_sync {
    #@to-do: expand this to take arguments for environment and site
    rsync -av comcastrsn@web-2358.prod.hosting.acquia.com:/var/www/html/comcastrsn.prod/docroot/sites/csnnw/files/ ~/Sites/nbcsports/docroot/sites/csnnw/files/
}

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
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

