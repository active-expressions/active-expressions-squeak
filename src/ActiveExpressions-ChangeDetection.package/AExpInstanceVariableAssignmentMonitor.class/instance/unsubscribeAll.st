subcribing
unsubscribeAll

	self subscriptions keys do: [:variable |
		(self subscriptionsForVariable: variable) do: [:subscription | 
			self removeSubscription: subscription forVariable: variable]]