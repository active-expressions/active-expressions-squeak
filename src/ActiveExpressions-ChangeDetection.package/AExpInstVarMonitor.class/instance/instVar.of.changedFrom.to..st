notifying
instVar: variableName of: anObject changedFrom: oldValue to: newValue
	
	oldValue ~~ newValue ifTrue: [
		(self subscriptionsFor: variableName) do: [:subscription |
			subscription do: [:publisher :subscriber |
				(anObject == publisher) ifTrue: [
					subscriber 
						perform: #instVar:of:changedFrom:to:
						withArguments: { variableName . publisher . oldValue . newValue }]]]]