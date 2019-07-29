tests
testRemembersOldValue

	value := self newValue.
	activeExpression update.
	self assert: lastValue equals: activeExpression lastValue