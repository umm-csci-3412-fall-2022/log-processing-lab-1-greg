#!/usr/bin/env bash

contents=$1
headfoot=$2
filename=$3

#The name of the file containing the "contents" that need to be wrapped,
#The name used to specify the desired header and footer,
#The name of the resulting file.

#Wraps the contents with the header and footer and places it into the filename chosen by the third argument.
touch "$filename"

cat "$headfoot"_header.html "$contents"  "$headfoot"_footer.html > "$filename"
