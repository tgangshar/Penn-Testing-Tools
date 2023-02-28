#!/bin/bash

# Read host list from file
hosts=($(cat target.txt))

for host in "${hosts[@]}"
do
   echo "Performing network scanning on ${host}:"
   
   #nmap  options:
   #-sV: service versions
   nmap -sV $host

   #-O: Operating system information
   nmap -O $host
   nmap --script banner $host
done

for host in "${hosts[@]}"
do
   echo "Performing network scripting on ${host}:"
   
   #Nmap scrpting engine options:
   #ftp-anon: Checks if ftp login is accessible
   # if statement for whether anon returns a telnet login
   nmap --script ftp-anon $host

   #ftp-bruteforce: Uses array of passwords to access ftp
   nmap --script ftp-bruteforce.nse $host
   
   #ftp-bruteforce: Uses array of passwords to access telnet
   nmap --script telnet-bruteforce.nse $host
   #http-auth-finder: Return list of web forms and html basic on the port
   nmap --script http-auth-finder $host
done