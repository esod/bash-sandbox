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
while getopts ":e" OPTION; do
  case $OPTION in
    e)
      echo "Migrating echo styles" >&2
      migrate_echo_styles = '?echo_migration=TRUE'
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done