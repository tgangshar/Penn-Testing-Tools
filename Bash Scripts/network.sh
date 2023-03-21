#!/bin/bash

# Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Get a list of network interfaces
interfaces=$(ip -o link show | awk -F': ' '{print $2}')

# Loop through the interfaces and print their details
for interface in $interfaces
do
    echo "Interface: $interface"
    ifconfig_output=$(ifconfig $interface 2>/dev/null)
    if [[ $? -ne 0 ]]; then
        echo "    Error: Could not get interface details"
        continue
    fi
    ip_address=$(echo "$ifconfig_output" | awk '/inet /{print $2}')
    mac_address=$(echo "$ifconfig_output" | awk '/ether /{print $2}')
    echo "    IP address: $ip_address"
    echo "    MAC address: $mac_address"
    ipv6_address=$(ip -6 addr show dev $interface | awk '/inet6 /{print $2}')
    if [[ -n $ipv6_address ]]; then
        echo "    IPv6 address: $ipv6_address"
    fi
    # Discover route
    gateway=$(ip route show dev $interface | awk '/default/{print $3}')
    if [[ -n $gateway ]]; then
        echo "    Gateway: $gateway"
    fi
# Print services running
ps
done