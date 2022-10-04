#!/usr/bin/env bash

#Takes a directory containing country_dist.html, hours_dist.html, and username_dist.html
directory="$1"

# Collects the contents of all the generated files and then wraps them.
cat "$directory"/country_dist.html "$directory"/hours_dist.html "$directory"/username_dist.html > assembled.txt

./bin/wrap_contents.sh assembled.txt html_components/summary_plots "$directory"/failed_login_summary.html

rm assembled.txt
