instruction decoding
storeIntoTemporaryVariable: offset

	currentContext == topContext ifTrue: [
		self tempVarAccessed: offset + 1].
	^ super storeIntoTemporaryVariable: offset