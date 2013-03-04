#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
# 
# Based on work by http://github.com/jehiah
# this prints out some branch status (similar to the '... ahead' info you get from git status)
# 
# Gives an output to the effect of:
# Branch                   Behind          Ahead
# origin/master            0 behind        0 ahead
# upstream/master          0 behind        0 ahead
# acquia/master            0 behind        0 ahead
# acquia/rsn-stage         71 behind       0 ahead
# acquia/rsn-prod          71 behind       0 ahead
# rsn-v2.0.3-alpha         71 behind       0 ahead
# acquia/rsn-hotfix        107 behind      3 ahead
remotes=( 
    origin/master
    dev/master
    bitbucket/master
    github/master
    upstream/master
    acquia/master
    acquia/rsn-stage
    rsn-2.0.6-l
    $@
)
#Print out column headers "Branch", "Ahead", and "Behind"
echo "\n\033[38;5;148mBranch    \t\t Behind \t Ahead\033[39m"

#Loop through the branches and count the number of commits each is ahead/behind the current HEAD
for ref in ${remotes[@]}
do
git rev-list --left-right HEAD...$ref -- 2>/dev/null >/tmp/git_upstream_status_delta || continue
LEFT_AHEAD=$(grep -c '^<' /tmp/git_upstream_status_delta)
RIGHT_AHEAD=$(grep -c '^>' /tmp/git_upstream_status_delta)

echo "$ref       \t $LEFT_AHEAD behind \t $RIGHT_AHEAD ahead"
done