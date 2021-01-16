#!/usr/bin/env bash

# configure
LIBRARY='./library'
CARRELS='/export/reader/carrels'

# sanity check
if [[ -z $1 || -z $2 ]]; then
	echo "Usage: $0 <directory> <shortname>"
	exit
fi

# get input
PROCESS=$1
SHORTNAME=$2

# change ownership
sudo chown -R emorgan "$CARRELS/$PROCESS"

# add the item to the library
cd $LIBRARY
rm -rf "$SHORTNAME"
ln -s $CARRELS/$PROCESS ./$SHORTNAME

# update the scripts' configuration(s)
#perl -p -i -e "s/##SHORTNAME##/$SHORTNAME/g" ./$SHORTNAME/cgi-bin/*.cgi

# done
exit
