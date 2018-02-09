private
addSubscription: aSubscription

	| variableSubs variableName |
	variableName := aSubscription variableName.
	(self monitorsVariable: variableName)
		ifFalse: [self startMonitoringVariable: variableName].
	variableSubs := self subscriptionsFor: variableName.
	variableSubs add: aSubscription.
	
	(self variableComesFromSuperclass: variableName) ifTrue: [
		self superclassMonitor addSubscription: aSubscription]