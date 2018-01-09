subcribing
unsubscribe: aSubscriber fromVariable: variableName of: aPublisher

	(self subscriptionsForVariable: variableName) do: [:subscription |
		(subscription subscriber == aSubscriber 
		and: [subscription publisher == aPublisher]) ifTrue: [
			self removeSubscription: subscription forVariable: variableName]]