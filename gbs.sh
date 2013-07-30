#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal Compares remote branches to local branch.
#
# @category git
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
# Based on work by http://github.com/jehiah
#
# @todo use the current working directory as a context to select the right list
# of remotes.
# 
# This prints out some branch status (similar to the '... ahead' info you get 
# from git status)
# 
# Gives an output to the effect of:
#   
#   +-----------------------------------------------------+
#   | Branch                   Behind          Ahead      |
#   | origin/master            0 behind        0 ahead    |
#   | origin/dev-branch        107 behind      3 ahead    |
#   | upstream/master          71 behind       0 ahead    |
#   +-----------------------------------------------------+
#
# Requirements:
# 1. Git installed
# 2. A unix-like environment (e.g. terminal on OSX or cygwin/git bash on windows)
# 3. A writable /tmp/ directory
#
# Usage:
# 1. Save this file anywhere 
# 2. Checkout the git branch you wish to compare, and invoke the script 
#   (i.e. give the command '/path/to/file/gbs.sh).  Protip: save a bash
#   alias to the effect of <alias gbs="/path/to/file/gbs.sh">
# 3. Takes unlimited arguments.  So if you want to compare some-remote/some-branch
#   with your local you would type "gbs.sh some-remote/some-branch"
remotes=( 
    origin/master
    upstream/master
    acquia/master
    webserver/master
    acquia/staging
    bitbucket/master
    # github/master
    dev/master
    stage/master
    prod/master
    acquia/rsn-stage
    darby/master
    jason/master
    malcolm/master
    rich/master
    george/master
    rsn-2.0.9-l
    rsn-2.0.9-m
    $@
)
#Print out column headers "Branch", "Ahead", and "Behind"
echo "\n\033[38;5;148mBranch    \t\t Behind \t Ahead\033[0;39m"

#Loop through the branches and count the number of commits each is ahead/behind the current HEAD
for ref in ${remotes[@]}
do
git rev-list --left-right HEAD...$ref -- 2>/dev/null >/tmp/git_upstream_status_delta || continue
LEFT_AHEAD=$(grep -c '^<' /tmp/git_upstream_status_delta)
RIGHT_AHEAD=$(grep -c '^>' /tmp/git_upstream_status_delta)

echo "$ref       \t $LEFT_AHEAD behind \t $RIGHT_AHEAD ahead"
done