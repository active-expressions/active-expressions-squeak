tests
testInstVarsInMethodsWithKeywordMessagesAreFound

	| foundVars |
	expression := [publisher keywordMessage3Args].
	activeExpression := ActiveExpression monitoring: expression.
	foundVars := activeExpression instVarsToMonitor.
	self assert: self expectedFindings equals: foundVars