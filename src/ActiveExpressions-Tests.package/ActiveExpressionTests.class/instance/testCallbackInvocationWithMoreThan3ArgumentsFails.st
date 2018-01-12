tests - callbacks
testCallbackInvocationWithMoreThan3ArgumentsFails

	activeExpression onChangeDo: [:one :two :three | 42].
	value := self newValue.
	self should: [activeExpression update] raise: Error