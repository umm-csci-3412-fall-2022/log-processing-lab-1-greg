#!/usr/bin/env bash

# Takes a set of gzipped files on the command file.

SCRATCH=$(mktemp -d)
echo "Temp directory is $SCRATCH"

# Takes a set of tar files on the command line and loops through them extracting the contents.
# creeates a directory named afte the computer it was collected from and places tje extracted contents in them int the form of failed_login_data.txt. 

# It then callls each of the scripts before finally placing the summary of all of them in parent directory of the scratch directory.
for tgzip in "$@"
do
	computer=$(basename -s _secure.tgz "$tgzip")

	mkdir "$SCRATCH"/"$computer"

       	tar -xf "$tgzip" --directory "$SCRATCH"/"$computer"
	./bin/process_client_logs.sh "$SCRATCH"/"$computer"

	done

./bin/create_username_dist.sh "$SCRATCH"
./bin/create_hours_dist.sh "$SCRATCH"
./bin/create_country_dist.sh "$SCRATCH"
./bin/assemble_report.sh "$SCRATCH"

mv "$SCRATCH"/failed_login_summary.html ./
rm -r "$SCRATCH"
