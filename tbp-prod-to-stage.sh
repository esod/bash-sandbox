#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal copy prod -> stage
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
ssh milk@166.78.111.60 "rsync -azvrO --exclude 'styles' --exclude 'js' --exclude 'css' /home/milk/sites/breakfastproject/nfs_files/live/* /home/milk/sites/breakfastproject/nfs_files/stage/"
ssh milk@166.78.111.60 'chmod 777 /home/milk/sites/breakfastproject/nfs_files/stage'
ssh milk@166.78.111.60 'mkdir -p /tmp/dump'

#Drop the local DB
echo "${start_of_line}Dropping entire stage database in order to make a clean copy from prod${end_of_line}"
drush @breakfast.stage sql-drop -y

#Copy the database from prod
echo "${start_of_line}copying database from prod -> stage, this may take a while${end_of_line}"
drush sql-sync -y --no-cache @breakfast.prod @breakfast.stage

echo "${start_of_line}Set the files directory${end_of_line}"
drush @breakfast.stage vset file_public_path 'sites/stage.thebreakfastproject.com/files'

echo "${start_of_line}Update google analytics account${end_of_line}"
drush @breakfast.stage vset googleanalytics_account "UA-29413933-3"

echo "${start_of_line}Resave theme settings${end_of_line}"
casperjs /Users/matt/Scripts/casper/tbp-submit-stage.js

echo "${start_of_line}Clearing cache${end_of_line}"
drush @breakfast.stage cc all