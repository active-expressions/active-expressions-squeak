tests - callbacks
testEnable

	activeExpression disable.
	activeExpression enable.
	value := self newValue.
	activeExpression update.
	self assert: 1 equals: callbackCount