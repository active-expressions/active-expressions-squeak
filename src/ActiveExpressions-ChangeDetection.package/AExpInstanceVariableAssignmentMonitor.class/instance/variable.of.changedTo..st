notifying
variable: variableName of: sourceObject changedTo: anObject
	
	(self subscriptionsForVariable: variableName) do: [:subscription |
		(sourceObject == subscription publisher) ifTrue: [
			self notify: subscription thatVariable: variableName changedTo: anObject]]