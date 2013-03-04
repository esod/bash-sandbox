#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#Run drush on all staging environments
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
echo "\033[38;5;148m[Starting $alias Staging 1]\033[39m"
drush @$alias.test "$@";
done