accessing
monitoredInstVars

	^ monitoredInstVars ifNil: [monitoredInstVars := OrderedCollection new]