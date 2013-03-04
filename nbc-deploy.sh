#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
# 
# Use after a pull request has been verified as good, simultaneously deploy 
# in upstream, origin, and dev
remotes=(
    origin
    upstream
    acquia
)

for ref in ${remotes[@]}
do
echo "\n\033[38;5;148m[Deploying in $ref]\033[39m"
git push $ref HEAD:master;
done
