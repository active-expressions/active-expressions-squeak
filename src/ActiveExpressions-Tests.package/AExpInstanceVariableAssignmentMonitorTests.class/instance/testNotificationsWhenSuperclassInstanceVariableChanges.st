tests
testNotificationsWhenSuperclassInstanceVariableChanges

	subclassedPublisher 
		onChangeOfInstVarNamed: 'variableOfInterest' 
		notify: self .
	subclassedPublisher variableOfInterest: 42.
	subclassedPublisher setVariableOfInterest: 43.
	self assert: 2 equals: self log size