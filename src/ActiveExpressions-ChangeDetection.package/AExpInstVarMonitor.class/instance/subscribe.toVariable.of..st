subcribing
subscribe: aSubscriber toVariable: variableName of: aPublisher

	| subscription |
	subscription := AExpSubscription 
						publisher: aPublisher 
						subscriber: aSubscriber 
						variableName: variableName
						owner: self.
	self addSubscription: subscription