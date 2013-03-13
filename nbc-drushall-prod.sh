#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# Run drush on all NBC production environements
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
echo "\n\033[38;5;148m[Starting $alias Prod]\033[39m"
drush @$alias.prod "$@";
done
fi