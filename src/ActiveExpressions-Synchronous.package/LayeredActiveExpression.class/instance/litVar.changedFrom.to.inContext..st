change notification
litVar: litVarBinding changedFrom: oldValue to: newValue inContext: aContext

	self trackingEnabled ifTrue: [self update]