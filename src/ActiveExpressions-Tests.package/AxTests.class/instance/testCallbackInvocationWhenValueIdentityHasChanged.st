tests - callbacks
testCallbackInvocationWhenValueIdentityHasChanged

	value := self newValue.
	activeExpression update.
	self assert: 1 equals: callbackCount