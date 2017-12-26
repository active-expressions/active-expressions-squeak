tests - callbacks
testCallbackInvocationWith1Argument

	activeExpression onChangeDo: [:new |
		self assert: 1 equals: new].
	value := 1.
	activeExpression update