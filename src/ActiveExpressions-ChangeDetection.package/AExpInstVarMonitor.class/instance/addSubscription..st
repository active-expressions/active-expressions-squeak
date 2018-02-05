private
addSubscription: aSubscription

	| variableSubs variableName isNewVariable |
	variableName := aSubscription variableName.
	variableSubs := self subscriptionsFor: variableName.
	isNewVariable := variableSubs isEmpty.
	variableSubs add: aSubscription.
	isNewVariable ifTrue: [
		self subscriptions at: variableName asSymbol put: variableSubs.
		self recompileMonitoredClass].
	
	(self variableComesFromSuperclass: variableName) ifTrue: [
		self superclassMonitor addSubscription: aSubscription]