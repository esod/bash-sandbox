#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal syncs nbcchicagodev to nbcchicago.local
#
# @category NBC
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#Copy the database and then wait
start_of_line="\n+--------------------------------------------------\n| "
end_of_line=" \n+--------------------------------------------------"

#Drop the local DB
echo "${start_of_line}Dropping entire local database in order to make a clean copy from dev${end_of_line}"
drush @nbcchicago.local sql-drop -y
mkdir -p /tmp/nbcsportsdev

#Copy the database from dev
echo "${start_of_line}copying database from dev -> local, this may take a while${end_of_line}"
drush sql-sync -y --no-cache @nbcchicago.dev @nbcchicago.local

#Set the proper files directory
echo "\n\033[38;5;148m[Setting proper files directory]\033[39m"
drush @nbcchicago.local vset file_temporary_path "/tmp/nbcsportsdev"

#Disable update module for performance reasons
echo "${start_of_line}Disabling update module${end_of_line}"
drush @nbcchicago.local dis -y update

#Enable stage_file_proxy, this is what gives us the images
echo "${start_of_line}Enabling stage_file_proxy${end_of_line}"
drush @nbcchicago.local en -y stage_file_proxy

#Clear the cache
echo "${start_of_line}Clearing cache${end_of_line}"
drush @nbcchicago.local cc all