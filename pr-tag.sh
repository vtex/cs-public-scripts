#!/bin/bash
prmsg=$1

patchRegex='^\[(patch|PATCH)\].*$' 
minorRegex='^\[(minor|MINOR)\].*$' 
majorRegex='^\[(major|MAJOR)\].*$' 

if [[ $prmsg =~ $patchRegex ]]
then
	ver='p'
elif [[ $prmsg =~ $minorRegex ]]
then
	ver='m'
elif [[ $prmsg =~ $majorRegex ]]
then
	ver='M'
else
	echo "No tag pattern match, won't tag any"
	exit 0
fi

git tag $(bumpit -$ver $(git describe --tags --abbrev=0))
