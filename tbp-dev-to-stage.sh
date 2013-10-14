#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal deploy from dev -> stage
#
# @category tbp.com
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
start_of_line="\n+--------------------------------------------------\n| "
end_of_line=" \n+--------------------------------------------------"

#Push the code with git
echo "${start_of_line}git push stage master${end_of_line}"
git push stage master

#Sync files directory
echo "${start_of_line}Syncing files directory${end_of_line}"
ssh milk@166.78.111.60 "rsync -azvrO --exclude 'styles' --exclude 'js' --exclude 'css' /home/milk/sites/breakfastproject/nfs_files/dev/* /home/milk/sites/breakfastproject/nfs_files/stage/"
ssh milk@166.78.111.60 'chmod 777 /home/milk/sites/breakfastproject/nfs_files/stage'
ssh milk@166.78.111.60 'mkdir -p /tmp/dump'

#Drop the local DB
echo "${start_of_line}Dropping entire staging database in order to make a clean copy from dev${end_of_line}"
drush @breakfast.stage sql-drop -y

#Copy the database from dev
echo "${start_of_line}copying database from dev -> stage, this may take a while${end_of_line}"
drush sql-sync -y --no-cache @breakfast.dev @breakfast.stage

echo "${start_of_line}Set the files directory${end_of_line}"
drush @breakfast.stage vset file_public_path 'sites/stage.thebreakfastproject.com/files'

echo "${start_of_line}Enable caching and css aggregation${end_of_line}"
drush @breakfast.stage vset preprocess_css 1
drush @breakfast.stage vset preprocess_js 1
drush @breakfast.stage vset cache 1
drush @breakfast.stage vset cache_lifetime "300"
drush @breakfast.stage vset page_cache_maximum_age "300"
drush @breakfast.stage vset page_compression 1
drush @breakfast.stage vset googleanalytics_account "UA-29413933-3"

echo "${start_of_line}Disable some modules${end_of_line}"
drush @breakfast.stage dis -y admin_menu apachesolr backup_migrate devel devel_debug_log devel_image_provider views_ui

echo "${start_of_line}Resave theme settings${end_of_line}"
casperjs /Users/matt/Scripts/casper/tbp-submit-stage.js

echo "${start_of_line}Clearing cache${end_of_line}"
drush @breakfast.stage cc all