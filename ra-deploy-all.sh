#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
echo "\033[38;5;148mgit push origin HEAD:master\033[39m"
git push origin HEAD:master;
echo "\033[38;5;148mgit push origin HEAD:staging\033[39m"
git push origin HEAD:staging;
echo "\033[38;5;148mgit push origin HEAD:qa\033[39m"
git push origin HEAD:qa;
echo "\033[38;5;148mgit push acquia HEAD:master\033[39m"
git push acquia HEAD:master;
echo "\033[38;5;148mgit push acquia HEAD:staging\033[39m"
git push acquia HEAD:staging;
echo "\033[38;5;148mgit push acquia HEAD:qa\033[39m"
git push acquia HEAD:qa;
echo "\033[38;5;148mgit push upstream HEAD:master\033[39m"
git push upstream HEAD:master;
echo "\033[38;5;148mgit push upstream HEAD:staging\033[39m"
git push upstream HEAD:staging;
echo "\033[38;5;148mgit push upstream HEAD:qa\033[39m"
git push upstream HEAD:qa;