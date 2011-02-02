#!/usr/local/bin/python
# -*- coding: utf-8 -*-
import sys
sys.path.append('../../../shared/python')
import BGF
import levels

if __name__ == "__main__":
	if len(sys.argv) != 2:
		print 'This tool calculates a DEP metric for any given BGF grammar.'
		print 'Usage:'
		print '      '+sys.argv[0]+' <bgf-input>'
		sys.exit(1)
	bgf = BGF.Grammar()
	bgf.parse(sys.argv[1])
	gl = levels.getLevels(bgf)
	#print 'DEP =',max(map(len,gl))
	print max(map(len,gl))
	sys.exit(0)