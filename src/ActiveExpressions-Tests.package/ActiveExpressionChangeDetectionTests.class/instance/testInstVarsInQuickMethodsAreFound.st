tests - simulation
testInstVarsInQuickMethodsAreFound

	| foundVars |
	expression := [publisher variableOfInterest].
	activeExpression := VarTraActiveExpression monitoring: expression.
	foundVars := activeExpression instVarsToMonitor.
	self assert: self expectedFindings equals: foundVars