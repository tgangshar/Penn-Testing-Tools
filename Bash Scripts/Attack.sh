#!/bin/bash

# Check if a hostname or IP address is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <hostname or IP address>"
    exit 1
fi

# Ping the target host with max packets
# For testing change ping amount
ping -c 65500 $1 

# For the Lab, removes related scripts
rm attack.sh network.sh