#!/usr/bin/env bash

statusCode=`curl -s -o /dev/null -w "%{http_code}" $DOWN_TIME_WEBSITE`

if (( statusCode >= 400 )); then
    mail -s "Down Time Alert: $DOWN_TIME_WEBSITE | $statusCode" $DOWN_TIME_ACCOUNT <<< `curl $DOWN_TIME_WEBSITE`
fi