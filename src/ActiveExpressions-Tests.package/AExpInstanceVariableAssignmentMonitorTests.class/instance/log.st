accessing
log
	
	^ log ifNil: [log := OrderedCollection new]
