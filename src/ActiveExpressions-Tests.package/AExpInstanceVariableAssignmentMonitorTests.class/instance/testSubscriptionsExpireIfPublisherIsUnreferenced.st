tests
testSubscriptionsExpireIfPublisherIsUnreferenced

	AExpMockPublisher new 
		onChangeOfInstVarNamed: 'variableOfInterest' 
		notify: self.
	Smalltalk garbageCollect.
	self assert: publisher class monitoredInstVarNames isEmpty