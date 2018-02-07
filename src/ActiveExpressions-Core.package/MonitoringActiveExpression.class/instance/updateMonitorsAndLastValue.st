change detection
updateMonitorsAndLastValue

	| dependencies |
	dependencies := Dictionary new.
	self setLastValue: (self simulateExpressionAndCollectDependenciesInto: dependencies).
	self updateMonitorsTo: dependencies flattenAssociations.