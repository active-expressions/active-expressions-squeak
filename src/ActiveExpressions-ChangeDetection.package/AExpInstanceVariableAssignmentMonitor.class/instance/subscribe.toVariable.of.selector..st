subcribing
subscribe: aSubscriber toVariable: variableName of: aPublisher selector: selector

	| subscription |
	subscription := AExpSubscription publisher: aPublisher subscriber: aSubscriber selector: selector.
	self addSubscription: subscription forVariable: variableName