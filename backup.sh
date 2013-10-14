#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal backup to NAS device
#
# @category AAA
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#

server_response=$(nc -z hamburglar 22);
if [ "${server_response}" = 'Connection to hamburglar 22 port [tcp/ssh] succeeded!' ]
then
	rsync -av --exclude=Downloads --exclude=Desktop/excluded --exclude=Library --exclude=Torrents --exclude=Trash /Users/matt/* root@hamburglar:/volume2/matt/rsync/matt
else
	echo 'server failed'
fi
