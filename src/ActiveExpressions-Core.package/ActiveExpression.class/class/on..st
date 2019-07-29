instance creation
on: aBlock

	| type |
	type := self = ActiveExpression ifTrue: [self defaultType] ifFalse: [self].
	^ type basicNew 
			setMonitoredBlock: aBlock;
			initialize