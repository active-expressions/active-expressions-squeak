tests
testSubscriptionsExpireIfSubscriberIsUnreferenced

	publisher 
		onChangeOfInstVarNamed: 'variableOfInterest' 
		notify: Object new.
	Smalltalk garbageCollect.
	self assert: publisher class monitoredInstVarNames isEmpty