#!/bin/sh
#
# @author Matt Korostoff <mkorostoff@gmail.com>
#
# @internal Open file with sublime.  Prompt if file doesn't exist.
#
# @category AAA
#
# @copyright Licensed under the GNU General Public License as published by the Free 
# Software Foundation, either version 3 of the License, or (at your option)
# any later version.  http://www.gnu.org/licenses/
#
# Open a file or list of files with Sublime.  Optionally create the file if
# it doesn't exist.
#
# Usage:
# 'sublime /path/to/file/one.txt path/to/file/two.txt'

declare -a files

# We can open and 
for file in $@
do
	if [ -f $file ];
	then
		# this is the same as '$files[] = $file' in php, or "push" in perl.
		# So this says "$files should be an array consisting of: all the 
		# values within $files", plus one more.  We'll use this only once
		# to open all of the files.
		files=("${files[@]}" "$file")
	else
		read -p "$file does not exist.  Create? " -n 1 -r
		echo "\n"
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			#if there are any slashes we know we're working with a directory
			slashes=$(echo "${file}"|sed 's/[^\/]//g')
			if [ ! -z ${slashes} ];
			then
				# find the name of the parent directory and create it
				# the regex here matches (and eliminates) any number
				# of non-slash characters following at least one slash
				# and ending a string.  So searching '/path/to/file.txt'
				# will yield '/path/to'
				parent_directory=$(echo ${file}|sed 's/\/[^\/]*$//g')
				mkdir -p $parent_directory
			fi
			# create the file
			touch $file
			# same 
			files=("${files[@]}" "$file")
		fi
	fi
done
open -a "/Applications/Sublime Text 2.app" ${files[@]};