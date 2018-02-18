tests
testNotificationsWhenAssignmentsAreNested

	publisher onChangeOfInstVarNamed: 'variableOfInterest' notify: self.
	publisher nestedAssignment: 42.
	self assert: 1 equals: self log size.
	publisher unsubscribe: self fromAssignmentNotificationsFor: 'variableOfInterest'