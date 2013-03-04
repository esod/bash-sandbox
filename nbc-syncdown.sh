#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# This will grab the database from prod, and ready it for use locally
#
# Usage: "syncdown [sitename]" e.g. issuing "syncdown csnbaltimore" will copy 
#        csnbaltimore.prod to csnbaltimore.local
#
# Requirements:
# 1. Matching drush aliases for local and prod.  For instance, if your local
#    alias is "@mysite.local" your production alias should be "@mysite.prod"
#    see http://api.drush.org/api/drush/examples!example.aliases.drushrc.php/3.x
#    for more information on drush aliases
# 2. ssh and rsync running locally, accessible to drush
# 3. stage_file_proxy module.  See http://drupal.org/project/stage_file_proxy
#    for more information on configuring this module. 
#
# @to-do: create the site locally if it doesn't exist.

#Copy the database and then wait
echo "\n\033[38;5;148m[copying database from $1 prod -> local, this may take up to 30 minutes]\033[39m"
drush sql-sync -y @$1.prod @$1.local
sleep 10

#Set the proper files directory
echo "\n\033[38;5;148m[Setting proper files directory]\033[39m"
drush @$1.local vset file_temporary_path "/tmp/nbcsportsdev"

#Disable update module for performance reasons
echo "\n\033[38;5;148m[Disabling update module]\033[39m"
drush @$1.local dis -y update

#Enable stage_file_proxy, this is what gives us the images
echo "\n\033[38;5;148m[Enabling stage_file_proxy]\033[39m"
drush @$1.local en -y stage_file_proxy

#Clear the cache
echo "\n\033[38;5;148m[Clearing cache]\033[39m"
drush @$1.local cc all
