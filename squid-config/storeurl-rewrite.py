#!/usr/bin/python
import sys
import re

while True:
	line = sys.stdin.readline()
	if not line: break	
	channel, url, other = line.split(" ", 2)
	if 'download.oracle.com' in url:
		url = re.sub(r'(.+)\?AuthParam=(.+)$', r'\1', url)
	print channel, url
	sys.stdout.flush()
