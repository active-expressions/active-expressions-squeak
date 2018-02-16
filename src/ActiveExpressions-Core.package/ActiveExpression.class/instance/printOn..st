printing
printOn: aStream

	aStream nextPutAll: 'ActiveExpression monitoring: '.
	self monitoredBlock 
		ifNil: [aStream nextPutAll: '<nothing>']
		ifNotNil: [:block | block sourceString printOn: aStream]