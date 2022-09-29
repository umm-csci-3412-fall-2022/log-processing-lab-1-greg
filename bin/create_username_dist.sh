#!/usr/bin/env bash

# Takes a single command line argument that is the name of a directory.
dir_name= "$1"

# Assume this script is being called in the project directory. In the temp test directory this contains the data directory where
# the the name of each subdirectory is the name of one of the computers we got log information from. Each of these contain the
# file failed_login_data.txt created by process_client_logs.sh
# It will then place the results in directory on given on the command line.

cut failed_login_data.txt --delim=" " -f4 |sort | uniq -c| awk 'match($0, /([0-9]+) (\S+)/, groups) {print "data.addRow([\x27" groups[1] "\x27, " groups[2] "]);"' >

