# Penn-Testing-Tools
Collection of Automation scripts for various penetration testing tasks. Since it is apart of a PennTesting course, the following directories are a correspondance between particular Lab assignments and automation scripts. Please refrence these for the Discussions.

All these tools are tested on UNIX (Kali Linux) 

# OSINT (**Will be updated**)
## Requirement Notes
## Utility Notes

# Active Information Gathering

[ping.sh](https://github.com/tgangshar/Penn-Testing-Tools/blob/main/Bash%20Scripts/ping.sh), [nmap-basic.sh](https://github.com/tgangshar/Penn-Testing-Tools/blob/main/Bash%20Scripts/nmap-basic.sh)

## Requirements Notes
[install nmap](https://nmap.org/book/install.html)
## Utility Notes
Populate target.txt with IP addresses and only sepearate them by spaces

# Post Exploitation
[network.sh](https://github.com/tgangshar/Penn-Testing-Tools/blob/main/Bash%20Scripts/network.sh), [Attack.sh](https://github.com/tgangshar/Penn-Testing-Tools/blob/main/Bash%20Scripts/Attack.sh)
## Requirement Notes
chmod +x network.sh 
chmod +x Attack.sh
## Utitity Note
Gains Network Information of a host system
Starts a ping DoS attack from the host system

# Client Side Exploitation
[VirusScan.py](https://github.com/tgangshar/Penn-Testing-Tools/tree/main/Python%20Scripts/VirusScan.py)
## Requirement Notes
python -m pip install requests
[API Key](https://www.virustotal.com/gui/join-us)
## Utitity Note
Scan a desired file for viruses and then output the results