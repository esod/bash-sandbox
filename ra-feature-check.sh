#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal Runs `drush features-diff` against all environemnts, 
#
# @category ra.com
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
# 
# Usage: Run from terminal, accepts no arguments.
#
# Requirements: drush aliases @ra.local, @ra.dev, @ra.stage, 
#
# Sample output:
#     
#	  +-------------------------------------------------------------------------------------------------------------+
#     |  Out-of-sync in local: 3 																					|
#     |  RA Article                     ra_article                     Enabled   7.x-1.0                Overridden  | 
#     |  RA Homepage                    ra_homepage                    Enabled                          Overridden  |
#     |  RA Webform                     ra_webform                     Enabled   7.x-1.0                Overridden  |
#     |																												|
#     |  Out-of-sync in dev: 1 																						|
#     |  RA Webform                     ra_webform                     Enabled   7.x-1.0                Overridden 	|
#     |																												|
#     |  Out-of-sync in stage: 																						|
#	  +--------------------------------------------------------------------------------------------------------------

red="\033[0;31m"
color_reset="\033[0m"

environments=(
	local
	dev
	stage
)

for env in ${environments[@]}
do
broken=$(drush @ra.${env} features-diff|grep 'Overridd\|Needs'|sed 's/Needs/Needs Review/')
printf "\n${red}Out-of-sync in ${env}: ${color_reset}"
printf "$broken"|grep -c ''
printf "$broken\n"
done