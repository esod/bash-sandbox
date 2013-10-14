#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal backup all sql databases
#
# @category AAA
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
# 
# @todo
# 
# 1. Prune sql backups.  The end results should be hourly backups for the past 5 days, 
#    daily backups for the past 30 days, weekly backups for the past year, monthly backups
#    forever. A simple enough implementation of this would be to set up a seperate sql-backup-hourly.sh,
#    sql-backup-daily, etc.  In an ideal world though, we would make this one script take 
#    an argument. 
#    
# 2. Add sanity check that will prevent this from executing at all if mysql 
#    server isn't running.
#    
# 3. Figure out why cron reports 'mysql command not found'.  Using the full path 
#    is kind of a work-around, because I might want to use a different version of
#    mysql later.
#    
# 4. Check to see when the database was last updated

#We'll use this date string as a unique identifyer for the dump file
date=$(date +%d-%b-%Y-%s);

# Here we generate an array listing all the database
databases=$(echo "show databases" | /usr/local/mysql/bin/mysql | grep -v 'Database\|information_schema\|performance_schema')

# Now we want to loop through each database, create a dump file, tarball the dumpfile.
# The end product of this is a file to the effect of "my_database_name-14-Oct-2013-1381732193.tgz"
for database in ${databases[@]}
do
mysqldump ${database} > ~/SQL/automated_backups/${database}-${date}.sql #this file will only be temporary. We're really after the tarball
tar -cvzf ~/SQL/automated_backups/${database}-${date}.tgz ~/SQL/automated_backups/${database}-${date}.sql #here we create the tarball
rm ~/SQL/automated_backups/${database}-${date}.sql #here we remove the temporary file
done

# Delete backups older than 5 days. This actually results in very little data loss
# because these files are backed up to an external drive regularly.
find /Users/matt/SQL/automated_backups* -mtime +5 -exec rm {} \;
