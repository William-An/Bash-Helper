#!/usr/bin/env bash

# Simple bash script that scrape the quote

host=http://quotes.toscrape.com/random

res=`curl $host | grep -e "<span"`
res=`echo $res | cut -d ">" -f2 -f5 | cut -d "<" -f1 -f2 | sed "s/<\/span>/^/g"`

quote=`cut -d "^" -f1 <<< $res`
author=`cut -d "^" -f2 <<< $res`

printf "$quote\n -- $author\n"
