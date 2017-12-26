tests - callbacks
testDisableCallbacks

	activeExpression disableCallbacks.
	value := 1.
	activeExpression update.
	self assert: 0 equals: callbackCount