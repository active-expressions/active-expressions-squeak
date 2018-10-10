tests
testAutomaticChangePropagation

	activeExpression := VarTraActiveExpression monitoring: [publisher variableOfInterest].
	activeExpression onChangeDo: callback.
	publisher variableOfInterest: self newValue.
	self assert: 1 equals: callbackCount