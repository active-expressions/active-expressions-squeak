tests
testSubscriptionsExpireIfSubscriberIsUnreferenced

	publisher 
		afterAssignmentToVariable: 'variableOfInterest' 
		notify: Object new 
		using: self selector.
	Smalltalk garbageCollect.
	self assert: publisher class monitoredInstVarNames isEmpty