tests - callbacks
testUnregisteredCallbacksAreNotInvoked

	activeExpression removeCallback: callback.
	value := self newValue.
	activeExpression update.
	self assert: 0 equals: callbackCount