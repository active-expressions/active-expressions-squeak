tests
testSubscriptionsExpireIfSubscriberIsUnreferenced

	publisher 
		onChangeOfInstVarNamed: 'variableOfInterest' 
		notify: Object new.
	Smalltalk garbageCollect.
	publisher class instVarMonitor removeObsoleteSubscriptions.
	self assert: publisher class monitoredInstVarNames isEmpty