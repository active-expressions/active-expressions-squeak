tests - callbacks
testCallbackInvocationWith1Argument

	activeExpression onChangeDo: [:new |
		self assert: lastValue equals: new].
	value := self newValue.
	activeExpression update