private
removeSubscription: aSubscription

	| variableSubs variableName |
	variableName := aSubscription variableName.
	variableSubs := self subscriptionsFor: variableName.
	variableSubs remove: aSubscription.
	variableSubs ifEmpty: [
		self subscriptions removeKey: variableName asSymbol.
		self recompileMonitoredClass].
	
	(self variableComesFromSuperclass: variableName) ifTrue: [
		self superclassMonitor removeSubscription: aSubscription]