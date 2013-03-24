#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal deploys to dev
#
# @category ra.com
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
yellow="\033[0;33m"
color_reset="\033[0m"

echo "${yellow}git push acquia master${color_reset}"
git push acquia master
echo "${yellow}sleep 30${color_reset}"
sleep 30
echo "${yellow}drush @ra.dev updb -y${color_reset}"
drush @ra.dev updb -y
echo "${yellow}drush @ra.dev cc all${color_reset}"
drush @ra.dev cc all