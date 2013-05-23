#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal 
#
# @category 
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
git rev-list --left-only --pretty="%C(white)>%C(yellow)%s %C(white)by %C(blue)%cn" ...$1|sed 's/commit [0-9a-fA-F]*$//g'|grep '.'