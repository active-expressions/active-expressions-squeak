change detection
updateMonitorsAndLastValue

	| dependencies newValue |
	dependencies := Dictionary new.
	[newValue := (self simulateExpressionAndCollectDependenciesInto: dependencies)] 
		on: Error
		do: [^ self].
	self setLastValue: newValue.
	self updateMonitorsTo: dependencies flattenAssociations.