tests - callbacks
testCallbackInvocationWithMoreThan3ArgumentsFails

	activeExpression onChangeDo: [:one :two :three | 42].
	self 
		should: [
				value := self newValue..
				activeExpression update]
		raise: Error