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
authors[2]="Cruanas"
authors[3]="Jason Cruanas"
authors[4]="Rosales"
authors[5]="Rich Rosales"
authors[6]="Malcolm"
authors[7]="Malcolm Poindexter"
authors[8]="Steshenko"
authors[9]="George Steshenko"

author_machine_name=0
while [  $author_machine_name -lt 10 ]; do
let author_human_name=author_machine_name+1
lines=$(git log --author="${authors[$author_machine_name]}" --pretty=tformat: --numstat upstream/master \
| awk '{ add += $1 ; subs += $2 ; loc += $1 + $2 ; } END { printf "added lines: %s \nremoved lines: %s \ntotal lines: %s\n",add,subs,loc }' -)
echo "\033[38;5;148m${authors[$author_human_name]}\033[39m" 
echo "${lines}\n"
let author_machine_name=author_machine_name+2
done