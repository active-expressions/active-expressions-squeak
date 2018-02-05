subcribing
unsubscribe: aSubscriber fromVariable: variableName of: aPublisher

	(self subscriptionsFor: variableName) do: [:subscription |
		subscription do: [:publisher :subscriber |
			(subscriber == aSubscriber 
			and: [publisher == aPublisher]
			and: [subscription owner == self]) ifTrue: [
				self removeSubscription: subscription]]]