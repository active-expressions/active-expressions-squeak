tests
testSubscriptionsExpireIfPublisherIsUnreferenced

	AExpMockPublisher new 
		onChangeOfInstVarNamed: 'variableOfInterest' 
		notify: self.
	Smalltalk garbageCollect.
	publisher class instVarMonitor removeObsoleteSubscriptions.
	self assert: publisher class monitoredInstVarNames isEmpty