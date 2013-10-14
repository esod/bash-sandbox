#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal copy prod -> dev
#
# @category tbp.com
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
start_of_line="\n+--------------------------------------------------\n| "
end_of_line=" \n+--------------------------------------------------"

#Sync files directory
echo "${start_of_line}Syncing files directory${end_of_line}"
ssh milk@166.78.111.60 "rsync -azvrO --exclude 'styles' --exclude 'js' --exclude 'css' /home/milk/sites/breakfastproject/nfs_files/live/* /home/milk/sites/breakfastproject/nfs_files/dev/"
ssh milk@166.78.111.60 'chmod 777 /home/milk/sites/breakfastproject/nfs_files/dev'
ssh milk@166.78.111.60 'mkdir -p /tmp/dump'

#Drop the local DB
echo "${start_of_line}Dropping entire dev database in order to make a clean copy from prod${end_of_line}"
drush @breakfast.dev sql-drop -y

#Copy the database from dev
echo "${start_of_line}copying database from prod -> dev, this may take a while${end_of_line}"
drush sql-sync -y --no-cache @breakfast.prod @breakfast.dev

echo "${start_of_line}Set the files directory${end_of_line}"
drush @breakfast.dev vset file_public_path 'sites/dev.thebreakfastproject.com/files'

echo "${start_of_line}Disable caching and css aggregation${end_of_line}"
drush @breakfast.dev vset preprocess_css 0
drush @breakfast.dev vset preprocess_js 0
drush @breakfast.dev vset cache 0
drush @breakfast.dev vset cache_lifetime "0"
drush @breakfast.dev vset page_cache_maximum_age "0"
drush @breakfast.dev vset page_compression 1
drush @breakfast.dev vset error_level 2
drush @breakfast.dev vset googleanalytics_account "UA-29413933-2"

echo "${start_of_line}Enable some modules${end_of_line}"
drush @breakfast.dev en -y admin_menu backup_migrate devel devel_debug_log devel_image_provider views_ui dblog update bp_tracking

echo "${start_of_line}Resave theme settings${end_of_line}"
casperjs /Users/matt/Scripts/casper/tbp-submit-dev.js

echo "${start_of_line}Clearing cache${end_of_line}"
drush @breakfast.dev cc all