#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal run drush on all sites
#
# @category ra.com
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
aliases=(
	ra.local
	ra.dev
	ra.stage
)

for alias in ${aliases[@]}
do
echo "\033[38;5;148m[Starting $alias ]\033[39m"
drush @${alias} "$@";
done