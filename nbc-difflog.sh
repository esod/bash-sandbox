#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# Generate a new difflog and push it to github

#check git status just as a reminder of uncommitted changes
git status;

#confirm before executing
read -p "
This will generate a new difflog, commit your index, and deploy_everywhere.  Continue? (y/n)  " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

#generate difflogs and save them to a file within the current git root
echo "\n\033[38;5;148m[Writing difflogs to file]\033[39m"
git diff --stat rsn-2.0.5-b > /Users/matt/Sites/nbcsports/library/prod_diff;
git diff --stat acquia/rsn-stage > /Users/matt/Sites/nbcsports/library/stage_diff;

#Commit the difflog
echo "\n\033[38;5;148m[Commiting new difflogs]\033[39m"
git commit -am 'updating difflog';

#deploy the difflog in origin/master, acquia/master, and upstream/master
deploy_everywhere;
fi