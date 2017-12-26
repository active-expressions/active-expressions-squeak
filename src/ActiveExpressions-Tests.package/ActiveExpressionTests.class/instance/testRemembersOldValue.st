tests
testRemembersOldValue

	value := 1.
	activeExpression update.
	self assert: 1 equals: activeExpression lastValue