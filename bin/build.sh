#!/usr/bin/env bash

# build.sh - one script to rule them all

BINDIRECTORY='/home/emorgan/bin/directory.pl'
HOME='/export/www/html/index.html'
INDEX='/home/emorgan/bin/index.sh'
LIBRARY='/export/www/html/library'
PUBLISH='/home/emorgan/bin/publish.sh'
TABLE='/home/emorgan/bin/table.sh'
TSV='/home/emorgan/etc/table.tsv'

if [[ -z $1 || -z $2 ]]; then
	echo "Usage: $0 <directory> <shortname>" >&2
	exit
fi

DIRECTORY=$1
SHORTNAME=$2
#CARREL=$3

rm -rf "$LIBRARY/$SHORTNAME"

$PUBLISH $DIRECTORY $SHORTNAME
$TABLE > $TSV
$BINDIRECTORY > $HOME
#$INDEX $SHORTNAME $CARREL
#ln -s $SHORTNAME/index.htm $SHORTNAME/about.html

exit

