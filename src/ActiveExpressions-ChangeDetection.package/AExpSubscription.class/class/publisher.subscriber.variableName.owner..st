instance creation
publisher: aPublisher subscriber: aSubscriber variableName: aString owner: anOwner

	^ self new
		initializeWithPublisher: aPublisher
		subscriber: aSubscriber
		variableName: aString
		owner: anOwner