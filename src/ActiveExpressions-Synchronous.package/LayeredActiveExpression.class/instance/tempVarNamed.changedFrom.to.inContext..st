change notification
tempVarNamed: varName changedFrom: oldValue to: newValue inContext: aContext

	self trackingEnabled ifTrue: [self update]