#!/bin/bash

# Read host list from file
hosts=($(cat target.txt))

# Ping options
# -c:  specifies the number of ping requests to send
# -i: sets the interval between ping requests in seconds
# -W: sets the amount of time in seconds to wait for a response to a ping request
ping_flags="-c 5 -i 0.2 -W 1"

# Trace Route options
# -n: prevents the command from performing reverse DNS lookups on each hop along the route
# -w: sets the timeout for each probe.
# -q: specifies probe packet sent per hop.
# -f: sets the starting TTL 
# -m: sets the maximum TTL value
tr_flags="-n -w 1 -q 1 -f 1 -m 30"

# Create a log file to store the results
log_file="recon_log.txt"
touch $log_file

# Loop through hosts and send ping requests and trace route 
for host in "${hosts[@]}"
do
  echo "Performing network diagnostics on ${host}:"
  echo "Performing network diagnostics on ${host}:" >> $log_file
  
  ping_result=$(ping $ping_flags $host)
  ping_loss=$(echo "$ping_result" | grep "packet loss" | awk '{print $6}')
  ping_time=$(echo "$ping_result" | grep "round-trip" | awk '{print $4}')
  
  echo "Ping result for ${host}: loss=${ping_loss}, time=${ping_time}"
  echo "Ping result for ${host}: loss=${ping_loss}, time=${ping_time}" >> $log_file
  
  traceroute_result=$(traceroute $tr_flags $host)
  traceroute_hops=$(echo "$traceroute_result" | awk '{print $1,$2,$3}')
  
  echo "Traceroute result for ${host}: ${traceroute_hops}"
  echo "Traceroute result for ${host}: ${traceroute_hops}" >> $log_file
  
  echo ""
  echo "" >> $log_file
done

#Future Implementation: Ping the IP addresses between hops from Tr.
