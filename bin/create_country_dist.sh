#!/usr/bin/env bash

#Takes a single command line argument.
dir_name="$1"

for compdir in "$dir_name"/*
do
	cut "$compdir"/failed_login_data.txt --delim=" " -f5 >> cut_IP.txt
done

sort cut_IP.txt > sorted_cut_IP.txt

join sorted_cut_IP.txt etc/country_IP_map.txt | cut --delim=" " -f2 | sort | uniq -c  \
	|awk ' match($0, /([0-9]+) (\S+)/, group) {print "data.addRow([\x27" group[2] "\x27, " group[1] "]);"}' >> scratch_data.txt

./bin/wrap_contents.sh scratch_data.txt html_components/country_dist "$dir_name"/country_dist.html

rm cut_IP.txt
rm sorted_cut_IP.txt
rm scratch_data.txt
