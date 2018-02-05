tests - simulation
testInstVarsInMethodsWithKeywordMessagesAreFound

	| foundVars |
	expression := [publisher keywordMessage3Args].
	activeExpression := MonitoringActiveExpression monitoring: expression.
	foundVars := activeExpression instVarsToMonitor.
	self assert: self expectedFindings equals: foundVars