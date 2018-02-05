tests - simulation
testInstVarsInQuickMethodsAreFound

	| foundVars |
	expression := [publisher variableOfInterest].
	activeExpression := MonitoringActiveExpression monitoring: expression.
	foundVars := activeExpression instVarsToMonitor.
	self assert: self expectedFindings equals: foundVars