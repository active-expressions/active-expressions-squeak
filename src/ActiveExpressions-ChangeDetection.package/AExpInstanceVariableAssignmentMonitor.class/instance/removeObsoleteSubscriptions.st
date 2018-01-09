accessing
removeObsoleteSubscriptions

	self subscriptions keys do: [:variable |
		(self subscriptionsForVariable: variable) do: [:subscription |
			subscription isObsolete 
				ifTrue: [	self removeSubscription: subscription forVariable: variable]]]