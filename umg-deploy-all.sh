#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal git push to github, bitbucket, planet2.
#
# @category umg
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
yellow="\033[0;33m"
color_reset="\033[0m"

echo "${yellow}git push webserver master${color_reset}"
git push webserver master
echo "${yellow}git push origin master${color_reset}"
git push origin master
echo "${yellow}git push upstream master${color_reset}"
git push upstream master