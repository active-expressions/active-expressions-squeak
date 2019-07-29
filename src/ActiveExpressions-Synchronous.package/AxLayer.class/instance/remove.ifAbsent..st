adding / removing
remove: anActiveExpression ifAbsent: aBlock

	anActiveExpression removeLayer: self.
	^ self expressions remove: anActiveExpression ifAbsent: aBlock