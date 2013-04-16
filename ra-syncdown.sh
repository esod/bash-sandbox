#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
# 
# @category ra.com
# 
# @internal sync dev DB to local
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
yellow="\033[0;33m"
color_reset="\033[0m"

#Copy the database and then wait
echo "\n${yellow}copying database from dev -> local, this may take a while${color_reset}"
drush sql-sync -y --no-cache @ra.dev @ra.local
sleep 10

#Disable update module for performance reasons
echo "\n${yellow}Disabling update module${color_reset}"
drush @ra.local dis -y update

#Enable stage_file_proxy, this is what gives us the images
echo "\n${yellow}Enabling stage_file_proxy${color_reset}"
drush @ra.local en -y stage_file_proxy module_builder devel_debug_log

#Clear the cache
echo "\n${yellow}Clearing cache${color_reset}"
drush @ra.local cc all
