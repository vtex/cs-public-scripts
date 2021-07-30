#!/bin/bash
prmsg=$1 

patchRegex='^\[(patch|PATCH)\].*$' 
minorRegex='^\[(minor|MINOR)\].*$' 
majorRegex='^\[(major|MAJOR)\].*$' 

if [[ $prmsg =~ $patchRegex ]]
then
	tagit -p
elif [[ $prmsg =~ $minorRegex ]]
then
	tagit -m
elif [[ $prmsg =~ $majorRegex ]]
then
	tagit -M
else
	echo "No tag pattern match, won't tag any"
fi
