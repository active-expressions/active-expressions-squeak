accessing
removeSubscription: aSubscription forVariable: variableName

	| existingSubs newSubs |
	(self isResponsibleFor: aSubscription) ifFalse: [^ self].
	existingSubs := self subscriptionsForVariable: variableName.
	newSubs := existingSubs reject: [:each | each == aSubscription].
	newSubs
		ifEmpty: [self subscriptions removeKey: variableName asSymbol.
				self recompileMonitoredClass]
		ifNotEmpty: [self subscriptions at: variableName asSymbol put: newSubs].
	
	(self variableComesFromSuperclass: variableName) ifTrue: [
		self superclassMonitor removeSubscription: aSubscription forVariable: variableName]