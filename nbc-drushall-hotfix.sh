#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/

#Run drush on all hotfix environments
aliases=(
    csnbaltimore
    csnhouston
    csnwashington
    csnbayarea
)

for alias in ${aliases[@]}
do
echo "\033[38;5;148m[Starting $alias Hotfix]\033[39m"
drush @$alias.hotfix "$@";
done