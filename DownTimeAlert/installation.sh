#!/usr/bin/env bash

# Set env variabbles
bash ./test.sh 2> /dev/null
res=$?
if [[ $res != 0 ]]; then
    echo "Please install in the repo directory"
    exit $res
fi
echo "export DOWN_TIME_ALERT_INSTALL_DIR=`pwd`" >> ~/.alertprofile

read -p "Please enter alert email account: " emailAccount
echo "export DOWN_TIME_ACCOUNT=$emailAccount" >> ~/.alertprofile

read -p "Please enter website to be listened: " website
echo "export DOWN_TIME_WEBSITE=$website" >> ~/.alertprofile

source ~/.alertprofile

# Test sending
echo "Sending test email..."
mail -s "Down Time Alert test" $emailAccount <<< "Hello"
echo "Successfully sent email, please check your mailbox, especially spam"
echo "Successfully configure email alert system, runing start.sh to initiate alert sequence"

bash ./start.sh

echo "Successfully ran start.sh"
