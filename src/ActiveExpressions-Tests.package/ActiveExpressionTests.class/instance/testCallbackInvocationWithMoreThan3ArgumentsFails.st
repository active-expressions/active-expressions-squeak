tests - callbacks
testCallbackInvocationWithMoreThan3ArgumentsFails

	activeExpression onChangeDo: [:one :two :three | 42].
	value := 1.
	self should: [activeExpression update] raise: Error