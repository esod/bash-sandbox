#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
declare -a authors
authors[0]="Korostoff"
authors[1]="Matt Korostoff"
authors[2]="azhulin"
authors[3]="Alex Zhulin"
authors[4]="Sakurada"
authors[5]="Mark Sakurada"
authors[6]="Beeman"
authors[7]="Jeff Beeman"

author_machine_name=0
while [  $author_machine_name -lt 8 ]; do
let author_human_name=author_machine_name+1
lines=$(git log --author="${authors[$author_machine_name]}" --pretty=tformat: --numstat upstream/master \
| awk '{ add += $1 ; subs += $2 ; loc += $1 + $2 ; } END { printf "added lines: %s \nremoved lines: %s \ntotal lines: %s\n",add,subs,loc }' -)
echo "\033[38;5;148m${authors[$author_human_name]}\033[39m" 
echo "${lines}\n"
let author_machine_name=author_machine_name+2
done