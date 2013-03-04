#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
authors=(
    Korostoff
    azhulin
    Sakurada
    Beeman
)

for author in ${authors[@]}
do
echo $author
git log --author="$author" --pretty=tformat: --numstat upstream/master \
| awk '{ add += $1 ; subs += $2 ; loc += $1 + $2 ; } END { printf "added lines: %s removed lines : %s total lines: %s\n",add,subs,loc }' -
done