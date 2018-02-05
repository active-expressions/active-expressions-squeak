tests - callbacks
testDisable

	activeExpression disable.
	value := self newValue.
	activeExpression update.
	self assert: 0 equals: callbackCount