tests - simulation
testInstVarsInQuickMethodsAreFound

	| foundVars |
	expression := [publisher variableOfInterest].
	activeExpression := ActiveExpression monitoring: expression.
	foundVars := activeExpression instVarsToMonitor.
	self assert: self expectedFindings equals: foundVars