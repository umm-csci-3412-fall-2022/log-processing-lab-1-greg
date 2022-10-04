#!/usr/bin/env bash

# Takes a set of gzipped files on the command file.

SCRATCH=$(mktemp -d)
echo "Temp directory is $SCRATCH"

for tgzip in "$@"
do
	tar -xf "$tgzip" -C "$SCRATCH"
	./bin/process_client_logs.sh "$SCRATCH"

done

./bin/create_username_dist.sh "$SCRATCH"
./bin/create_hours_dist.sh "$SCRATCH"
./bin/create_country_dist.sh "$SCRATCH"
./bin/assemble_report.sh "$SCRATCH"
