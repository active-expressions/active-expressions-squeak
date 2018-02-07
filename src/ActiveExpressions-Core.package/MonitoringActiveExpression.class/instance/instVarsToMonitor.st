change detection
instVarsToMonitor

	| dependencies |
	self simulateExpressionAndCollectDependenciesInto: (dependencies := Dictionary new).
	^ dependencies