
#!/usr/bin/env python
#
# OSINT.py
# Execute Linux commands
# Search Shodan and print summary information for the query.
#
# Author: Tenzin

import shodan
import sys
import random
import whois
from nslookup import Nslookup
import socket
import dns.resolver
from datetime import datetime

def Shodan(domain):
   # Configuration
   API_KEY = API_KEY.txt

   # The list of properties we want summary information on
   FACETS = [
      'product',
      'country',
      'cloud.provider',
      'ip',
      'port',
      'org',
      'device',

      ('port', 1000),
   ]

   FACET_TITLES = {
      'ip' : 'IP',
      'port': 'Ports',
      'product': "Products",
      'country': "country",
      'device':'vuln',
      'cloud.provider': "Cloud Provider",
      'org':'organization',
   }
   QUERIES= company

   api = shodan.Shodan(API_KEY)
   
   print(QUERIES)
   for query in QUERIES:
      try:
         # Setup the api
         api = shodan.Shodan(API_KEY)
   
   
         # Use the count() method because it doesn't return results and doesn't require a paid API plan
         # And it also runs faster than doing a search().
         result = api.count(query, facets=FACETS)
         
         print('\n----------------------------')
         print ('Shodan Summary Information')
         print('----------------------------')
         print ('Query: %s' % query)
         print ('Total Results: %s\n' % result['total'])
      
         # Print the summary info from the facets

         for facet in result['facets']:
               print (FACET_TITLES[facet])
      
               for term in result['facets'][facet]:
                  print ('%s: %s' % (term['value'], term['count']))
      
               # Print an empty line between summary info
               print('----------------------------')
         print('')
   
      except Exception:
         print ('Error: %s' % e)
         sys.exit(1)

def Linux(comapany):
   #Translate the comapny into a domain name
   domain = company + '.com'

   # whoIs Querry
   who = whois.whois(domain)
   # print of domain expiration

   #WhoIs Experiation Date Object
   #who.expiration_date
   #whoIs Text object
   #who.text
  
   # Initialize Nslookup from https://pypi.org/project/nslookup/
   dns_query = Nslookup()
   # Alternatively, the Nslookup constructor supports optional
   # arguments for setting custom dns servers (defaults to system DNS),
   # verbosity (default: True) and using TCP instead of UDP (default: False)
   dns_query = Nslookup(dns_servers=["1.1.1.1"], verbose=False, tcp=False)

   ips_record = dns_query.dns_lookup(domain)
   soa_record = dns_query.soa_lookup(domain)
   
   #Print function that can also cat into a document
   print('\n----------------------------')
   print ('Linux Information')
   print('----------------------------')
   print ('WhoIs')
   print(who)
   print('-----------------------')
   print ('NsLookup')
   print(ips_record.response_full, ips_record.answer)
   print(soa_record.response_full, soa_record.answer)
   print('-----------------------')
   print('')


#company = input('Which Company do you want to investigate')
#automate retrieving correct domains
company = 'boeing'
Linux(company)
Shodan(company)

