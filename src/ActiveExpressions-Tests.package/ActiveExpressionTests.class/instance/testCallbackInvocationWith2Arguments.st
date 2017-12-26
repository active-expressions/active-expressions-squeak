tests - callbacks
testCallbackInvocationWith2Arguments

	activeExpression onChangeDo: [:old :new | 
		self assert: 42 equals: old.
		self assert: 1 equals: new].
	value := 1.
	activeExpression update