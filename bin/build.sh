#!/usr/bin/env bash

# build.sh - one script to rule them all; probably need to run as 

# configure
BINDIRECTORY='./bin/directory.pl'
HOME='/export/www/html/index.html'
LIBRARY='./library'
PUBLISH='./bin/publish.sh'
TABLE='./bin/table.sh'
TSV='./etc/table.tsv'

if [[ -z $1 || -z $2 ]]; then
	echo "Usage: $0 <directory> <shortname>" >&2
	exit
fi

DIRECTORY=$1
SHORTNAME=$2

rm -rf "$LIBRARY/$SHORTNAME"

$PUBLISH $DIRECTORY $SHORTNAME
$TABLE > $TSV
$BINDIRECTORY > $HOME

exit

