change notification
instVarNamed: varName ofObject: source changedFrom: oldValue to: newValue inContext: aContext

	self trackingEnabled ifTrue: [self update]