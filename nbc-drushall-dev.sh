#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
# 
# @category NBC
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# Run drush on all dev sites
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
echo "\033[38;5;148m[Starting $alias Dev]\033[39m"
drush @$alias.dev "$@";
done