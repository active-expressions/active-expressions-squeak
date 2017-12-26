tests - callbacks
testUnregisteredCallbacksAreNotInvoked

	activeExpression unregisterCallback: callback.
	value := 1.
	activeExpression update.
	self assert: 0 equals: callbackCount