#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal testing vset for tbp
#
# @category tbp.com
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
drush @breakfast.stage vset cache 1
drush @breakfast.stage vset cache_lifetime "300"
drush @breakfast.stage vset page_cache_maximum_age "300"
drush @breakfast.stage vset page_compression 1
drush @breakfast.stage vset preprocess_css 1
drush @breakfast.stage vset preprocess_js 1