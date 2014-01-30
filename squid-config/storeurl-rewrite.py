#!/usr/bin/python
import sys
import re

log = open('/usr/local/var/squid/logs/storeurl-rewrite.log', 'w')

while True:
	line = sys.stdin.readline()
	log.write(line)
	if not line: break	
	channel, url, other = line.split(" ", 2)
	if 'download.oracle.com' in url:
		url = re.sub(r'(.+)\?AuthParam=(.+)$', r'\1', url)
	print channel, url
	log.write(url)
	log.write('\n')
	log.flush()
	sys.stdout.flush()

log.close()