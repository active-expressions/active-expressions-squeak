tests
testSubscriptionsHoldObjectsWeakly

	publisher 
		afterAssignmentToVariable: 'variableOfInterest' 
		notify: Object new 
		using: self selector.
	self should: [publisher variableOfInterest: 42] raise: MessageNotUnderstood.