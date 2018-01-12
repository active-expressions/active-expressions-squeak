utilities
expectedFindings

	^ Dictionary new
		at: publisher put: { 'variableOfInterest' } asSet;
		at: self put: { 'publisher' } asSet;
		yourself