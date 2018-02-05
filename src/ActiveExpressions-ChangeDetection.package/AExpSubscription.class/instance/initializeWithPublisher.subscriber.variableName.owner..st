private
initializeWithPublisher: aPublisher subscriber: aSubscriber variableName: aString owner: anOwner

	(weakReferences := WeakArray new: 2)
		at: self publisherIndex put: aPublisher;
		at: self subscriberIndex put: aSubscriber.
	variableName := aString.
	owner := anOwner