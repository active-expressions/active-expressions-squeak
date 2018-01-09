instance creation
publisher: aPublisher subscriber: aSubscriber selector: selector

	^ self new
		initializeWithPublisher: aPublisher
		subscriber: aSubscriber
		selector: selector