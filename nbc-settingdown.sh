#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# The same as syncdown.sh but without the database copy

#Set the proper files directory
echo -e "\n\033[38;5;148m[Setting proper files directory]\033[39m"
drush @$1.local vset file_temporary_path "/tmp/nbcsportsdev"

#Disable update module
echo -e "\n\033[38;5;148m[Disabling update module]\033[39m"
drush @$1.local dis -y update

#Enable stage_file_proxy
echo -e "\n\033[38;5;148m[Enabling stage_file_proxy]\033[39m"
drush @$1.local en -y stage_file_proxy

#Clear the cache
echo -e "\n\033[38;5;148m[Clearing cache]\033[39m"
drush @$1.local cc all