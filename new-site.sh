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
echo "create database $1;"|mysql
cd ~/Sites/
drush dl drupal
mv drupal-* $1