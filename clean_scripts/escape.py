#!/usr/bin/python
import sys
import traceback

for line in sys.stdin:
    line = line.strip()
    if line == '':
        continue
    try:
        match = line.split('"')
        l = len(match)
        i = 0
        while i < l:
            if i % 2 == 1:
                match[i] = match[i].replace(',', '\\,')
            i += 1
        print ''.join(match)
    except:
        traceback.print_exc(file=sys.stderr)
        continue
