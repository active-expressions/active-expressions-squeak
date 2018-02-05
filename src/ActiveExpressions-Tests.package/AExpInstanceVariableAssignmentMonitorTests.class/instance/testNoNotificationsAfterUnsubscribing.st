tests
testNoNotificationsAfterUnsubscribing

	publisher onChangeOfInstVarNamed: 'variableOfInterest' notify: self.
	publisher unsubscribe: self fromAssignmentNotificationsFor: 'variableOfInterest'.
	publisher variableOfInterest: 42.
	self assert: 0 equals: self log size.