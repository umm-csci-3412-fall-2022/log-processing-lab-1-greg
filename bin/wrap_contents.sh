#!/usr/bin/env bash

contents=$1
headfoot=$2
filename=$3
#Wraps the contents with the header and footer and places it into the filename chosen by the third argument.
touch "$filename"

cat "$headfoot"_header.html "$contents"  "$headfoot"_footer.html > "$filename"
