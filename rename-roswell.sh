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
files=$(ls ~/Desktop/roswell|grep '')
i=1

for file in ${files[@]}
do
mv ~/Desktop/roswell/${file} ~/Desktop/roswell/${i}.jpg
i=$[i+1]
done