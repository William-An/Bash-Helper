#!/usr/bin/env bash

# Set the welcome message of linux terminal to random quote from http://quotes.toscrape.com
# Has to be run with administrative privilege

if [[ "$OSTYPE" == "linux-gnu" ]]; then
        banner=/etc/issue.net
elif [[ "$OSTYPE" == "darwin"* ]]; then
        banner=/etc/motd
fi

# Replace with your installation directory
installDir=/Users/william/MicroProjects/BashHelper/quoter
bash $installDir/getQuote.sh > $banner

