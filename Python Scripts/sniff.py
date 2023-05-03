import pyshark

# capture packets on the lo network interface
capture = pyshark.LiveCapture(interface='lo')

# filter for HTTP traffic
capture.sniff(filter="tcp port 80 or tcp port 443")

# process captured packets
for packet in capture:
    # check if this is an HTTP request or response
    if "HTTP" in packet:
        if "request" in packet.http:
            print("HTTP Request: " + packet.http.request_full_uri)
        elif "response" in packet.http:
            print("HTTP Response: " + packet.http.response_full_uri)
#look for Session ID like "security=low; PHPSESSID= ga2nh0hbaartd0bp0c7s8s1dqu"