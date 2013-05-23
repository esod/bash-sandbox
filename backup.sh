#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal backup to NAS device
#
# @category 
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# @to-do
# 
# 1. check if server is active
# 2. do an incremental backup ala http://www.mikerubel.org/computers/rsync_snapshots/#Incremental
# 3. run on chron daily
# 
server_response=$(nc -z hamburglar 22);
if [ "${server_response}" = 'Connection to hamburglar 22 port [tcp/ssh] succeeded!' ]
then
	echo 'kaaaa'
else
	echo 'server failed'
fi
