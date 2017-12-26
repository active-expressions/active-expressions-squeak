tests - callbacks
testUnregisteringAllCallbacks

	activeExpression onChangeDo: [self fail].
	activeExpression unregisterAllCallbacks.
	value := 1.
	activeExpression update.
	self assert: 0 equals: callbackCount