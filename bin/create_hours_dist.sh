#!/usr/bin/env bash

# Takes a single command line argument that is the dame of a directory
dir_name="$1"

#assume this script is being called in the project directory. It goes into a subdirectory, which is named after the computer the logs appeared on, of the given arguemnt and cuts out the hours column and then loops to the next subdirectory cutting out the hours logged on that computer. It then counts the repeats and then awks that into an html command. it is then wrapped by the create_hours_dist header and foooter.


for compdir in "$dir_name"/*/
do
	cut "$compdir"/failed_login_data.txt --delimiter=" " -f3 >> SCRATCH3.txt 
done

sort SCRATCH3.txt | uniq -c |awk 'match($0, /([0-9]+) ([0-9]+)/, group) {print "data.addRow([\x27" group[2] "\x27, " group[1] "]);"}' >> SCRATCH4.txt

./bin/wrap_contents.sh SCRATCH4.txt html_components/hours_dist "$dir_name"/hours_dist.html
