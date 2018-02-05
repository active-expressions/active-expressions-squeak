tests
testNotificationsWhenInstanceVariableChanges

	publisher onChangeOfInstVarNamed: 'variableOfInterest' notify: self.
	publisher variableOfInterest: 42.
	self assert: 1 equals: self log size.
	publisher unsubscribe: self fromAssignmentNotificationsFor: 'variableOfInterest'