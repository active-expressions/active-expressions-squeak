accessing
subscriptionsFor: variableName

	 ^ self subscriptions at: variableName asSymbol ifAbsent: [OrderedCollection new]