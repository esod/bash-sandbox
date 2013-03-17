#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal runs 'git diff ...[argument]'
#
# @category git
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# Gives a one-way diff stat AND full diff of an arbitrary branch
# similar to running:
# git diff --stat ...some_remote/some_branch;
# git diff ...some_remote/some_branch;
echo "\n";
git diff --stat ..."$@";
echo "\n";
git diff ..."$@";