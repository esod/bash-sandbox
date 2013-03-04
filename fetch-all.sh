#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# Fetch all the remotes of everyone I merge from frequently
remotes=(
    alex
    ali
    mark
    upstream
    acquia
)

for ref in ${remotes[@]}
do
echo "\033[38;5;148m[Fetching $ref]\033[39m"
git fetch $ref;
done