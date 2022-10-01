#!/usr/bin/env bash

# Takes a single command line argument that is the name of a directory.
dir_name=$1

#touch username.html
# Assume this script is being called in the project directory. In the temp test directory this contains the data directory where
# the the name of each subdirectory is the name of one of the computers we got log information from. Each of these contain the
# file failed_login_data.txt created by process_client_logs.sh
# It will then place the results in directory on given on the command line.
for compdir in "$dir_name"/*/
do
	cut "$compdir"/failed_login_data.txt --delim=" " -f4 |sort | uniq -c| awk 'match($0, /([0-9]+) (\S+)/, group) {print "data.addRow([\x27" group[1] "\x27, " group[2] "]);"}' >> SCRATCH.txt
done

#./bin/wrap_contents.sh SCRATCH.txt html_components/username_dist "$dir_name"/username_dist.html

#rm SCRATCH.txt
