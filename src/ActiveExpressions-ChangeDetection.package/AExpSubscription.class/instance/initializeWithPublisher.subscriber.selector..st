private
initializeWithPublisher: aPublisher subscriber: aSubscriber selector: selector

	(variables := WeakArray new: 3)
		at: self publisherIndex put: aPublisher;
		at: self subscriberIndex put: aSubscriber;
		at: self selectorIndex put: selector