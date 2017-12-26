tests - callbacks
testCallbackInvocationWhenValueIdentityHasChanged

	value := 2.
	activeExpression update.
	self assert: 1 equals: callbackCount