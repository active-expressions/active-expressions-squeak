accessing
addSubscription: aSubscription forVariable: variableName

	| existingSubs isNewVariable |
	existingSubs := self subscriptionsForVariable: variableName.
	isNewVariable := existingSubs isEmpty.
	existingSubs add: aSubscription.
	self subscriptions at: variableName asSymbol put: existingSubs.
	isNewVariable ifTrue: [self recompileMonitoredClass].
	
	(self variableComesFromSuperclass: variableName) ifTrue: [
		self superclassMonitor addSubscription: aSubscription forVariable: variableName]