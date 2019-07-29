accessing
stack
	
	^ stack ifNil: [stack := OrderedCollection new]
