tests - callbacks
testUnregisteringAllCallbacks

	activeExpression onChangeDo: [self fail].
	activeExpression removeAllCallbacks.
	value := self newValue.
	activeExpression update.
	self assert: 0 equals: callbackCount