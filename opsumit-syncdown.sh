#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal sync tbp dev -> local
#
# @category opsumit
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
start_of_line="\n+--------------------------------------------------\n| "
end_of_line=" \n+--------------------------------------------------"

#Drop the local DB
echo "${start_of_line}Dropping entire local database in order to make a clean copy from dev${end_of_line}"
drush @opsumit.local sql-drop -y
mkdir -p /tmp/dump

#Copy the database from dev
echo "${start_of_line}copying database from dev -> local, this may take a while${end_of_line}"
drush sql-sync -y --no-cache @opsumit.dev @opsumit.local

#Disable update module for performance reasons
echo "${start_of_line}Disabling update module${end_of_line}"
drush @opsumit.local dis -y update

echo "${start_of_line}Disable CSS aggregation${end_of_line}"
drush @opsumit.local vset preprocess_css 0

echo "${start_of_line}Sync files from dev${end_of_line}"
rsync -azvr --exclude 'js' --exclude 'css' actelion@staging-5699.prod.hosting.acquia.com:/home/actelion/dev/sites/opsumit/files/* /Users/matt/Sites/opsumit/docroot/sites/opsumit/files/

#Enable stage_file_proxy, this is what gives us the images
echo "${start_of_line}Enabling stage_file_proxy${end_of_line}"
drush @opsumit.local en -y stage_file_proxy

#Clear the cache
echo "${start_of_line}Clearing cache${end_of_line}"
drush @opsumit.local cc all