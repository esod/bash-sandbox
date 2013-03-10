#!/bin/sh
#
# @author: Matt Korostoff, http://mattkorostoff.com
#
# Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# Open a file or list of files with Sublime.
# Usage:
# 'sublime /path/to/file/one.txt path/to/file/two.txt'
#
# @todo:
# 1. Create the file if it doesn't exist.
# 2. Create the directory structure if it doesn't exist.
# 3. Prompt before overwritting a file.
open -a "/Applications/Sublime Text 2.app" $@;