tests
testPrintingShowsSourceOfMonitoredBlock

	self assert: (activeExpression printString includesSubstring: expression sourceString)