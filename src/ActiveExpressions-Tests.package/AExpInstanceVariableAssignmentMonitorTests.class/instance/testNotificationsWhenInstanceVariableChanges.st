tests
testNotificationsWhenInstanceVariableChanges

	publisher afterAssignmentToVariable: 'variableOfInterest' notify: self using: self selector.
	publisher variableOfInterest: 42.
	self assert: 1 equals: self log size.
	publisher unsubscribe: self fromAssignmentNotificationsFor: 'variableOfInterest'