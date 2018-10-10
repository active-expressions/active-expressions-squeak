tests - simulation
testInstVarsInMethodsWithKeywordMessagesAreFound

	| foundVars |
	expression := [publisher keywordMessage3Args].
	activeExpression := VarTraActiveExpression monitoring: expression.
	foundVars := activeExpression instVarsToMonitor.
	self assert: self expectedFindings equals: foundVars