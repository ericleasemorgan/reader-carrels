#!/usr/bin/env bash

LIBRARY='/export/www/html/library'
INDEX='./bin/db2solr.pl'

# sanity check
if [[ -z $1 || -z $2 ]]; then
	echo "Usage: $0 <shortname> <carrel>"
	exit
fi

# get input
SHORTNAME=$1
CARREL=$2

# set up environment
cd $LIBRARY/$SHORTNAME

# do the work
perl -p -i -e "s/##CARREL##/$CARREL/g" ./cgi-bin/search-solr.cgi ./bin/db2solr.pl 
$INDEX

# done
exit
