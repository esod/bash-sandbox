#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal Runs `drush fd` against all environemnts
#
# @category ra.com
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
red="\033[0;31m"
color_reset="\033[0m"

environments=(
	local
	dev
	stage
)

for env in ${environments[@]}
do
broken=$(drush @ra.${env} fd|grep 'Overridd\|Needs'|sed 's/Needs/Needs Review/')
printf "\n${red}Out-of-sync in ${env}: ${color_reset}"
printf "$broken"|grep -c ''
printf "$broken\n"
done