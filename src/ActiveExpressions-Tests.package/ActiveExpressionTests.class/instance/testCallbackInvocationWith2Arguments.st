tests - callbacks
testCallbackInvocationWith2Arguments

	activeExpression onChangeDo: [:old :new | 
		self assert: self previousValue equals: old.
		self assert: lastValue equals: new].
	value := self newValue.
	activeExpression update