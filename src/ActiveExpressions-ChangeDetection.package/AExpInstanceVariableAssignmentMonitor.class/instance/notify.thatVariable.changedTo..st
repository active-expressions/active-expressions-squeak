notifying
notify: subscription thatVariable: variableName changedTo: anObject

	| publisher subscriber selector |
	publisher := subscription publisher.
	subscriber := subscription subscriber.
	selector := subscription selector.
	subscription isObsolete
		ifTrue: [self removeSubscription: subscription forVariable: variableName]
		ifFalse: [subscriber perform: selector withArguments: { variableName . publisher . anObject }]

	