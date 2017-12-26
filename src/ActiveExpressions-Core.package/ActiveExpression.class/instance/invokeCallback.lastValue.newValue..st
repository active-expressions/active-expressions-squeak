callbacks
invokeCallback: aBlock lastValue: old newValue: new

	aBlock argumentCount = 0 ifTrue: [^ aBlock value].
	aBlock argumentCount = 1 ifTrue: [^ aBlock valueWithArguments: { new }].
	aBlock argumentCount = 2 ifTrue: [^ aBlock valueWithArguments: { old . new }].
	self error: 'Callback requires too many arguments'