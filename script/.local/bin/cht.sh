#!/usr/bin/env bash

read -p "Enter Query: " QUERY

if [[ -z $QUERY ]]; then
	exit 1
fi

QUERY=`echo $QUERY | tr ' ' '+'`

curl cht.sh/python/$QUERY | bat
