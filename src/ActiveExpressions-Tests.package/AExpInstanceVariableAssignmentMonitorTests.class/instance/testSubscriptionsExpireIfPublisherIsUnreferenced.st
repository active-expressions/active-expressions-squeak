tests
testSubscriptionsExpireIfPublisherIsUnreferenced

	AExpMockPublisher new 
		afterAssignmentToVariable: 'variableOfInterest' 
		notify: self
		using: self selector.
	Smalltalk garbageCollect.
	self assert: publisher class monitoredInstVarNames isEmpty