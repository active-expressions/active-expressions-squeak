tests - callbacks
testDisableAllCallbacks

	activeExpression disableAllCallbacks.
	value := self newValue.
	activeExpression update.
	self assert: 0 equals: callbackCount