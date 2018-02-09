private
removeSubscription: aSubscription

	| variableSubs variableName |
	variableName := aSubscription variableName.
	variableSubs := self subscriptionsFor: variableName.
	variableSubs remove: aSubscription.
	variableSubs ifEmpty: [self stopMonitoringVariable: variableName].
	
	(self variableComesFromSuperclass: variableName) ifTrue: [
		self superclassMonitor removeSubscription: aSubscription]