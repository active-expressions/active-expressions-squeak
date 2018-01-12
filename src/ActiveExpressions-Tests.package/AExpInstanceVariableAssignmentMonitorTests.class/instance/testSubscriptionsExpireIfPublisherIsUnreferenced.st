tests
testSubscriptionsExpireIfPublisherIsUnreferenced

	AExpMockPublisher new 
		onChangeOfInstVarNamed: 'variableOfInterest' 
		notify: self
		using: self selector.
	Smalltalk garbageCollect.
	self assert: publisher class monitoredInstVarNames isEmpty