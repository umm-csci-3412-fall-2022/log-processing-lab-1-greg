#!/usr/bin/env bash

#Specified directory
dir_name=$1

#Move to the specified directory and loop through all the log files extracting the relevant info and redirecting output to failed_login_data.txt
for logfile in  "$dir_name"/var/log/*
do

	awk 'match($0, /([A-Z][a-z]+)\s+(\S+) (\S+):[0-9]+:[0-9]+.+Failed password .+ (\S+) from (\S+) port.+$/, groups) {print groups[1] " " groups[2] " " groups[3] " " groups[4] " " groups[5]}' < "${logfile}" >> "${dir_name}/failed_login_data.txt"

	done

