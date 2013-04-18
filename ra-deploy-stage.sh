#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal deploys to stage
#
# @category ra.com
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
yellow="\033[0;33m"
color_reset="\033[0m"

echo "${yellow}git push acquia HEAD:staging${color_reset}"
git push acquia HEAD:staging
echo "${yellow}sleep 30${color_reset}"
sleep 30
echo "${yellow}drush @ra.stage updb -y${color_reset}"
drush @ra.stage updb -y
echo "${yellow}drush @ra.stage cc all${color_reset}"
drush @ra.stage cc all