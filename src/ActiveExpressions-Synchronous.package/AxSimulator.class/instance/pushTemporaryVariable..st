instruction decoding
pushTemporaryVariable: offset

	currentContext == topContext ifTrue: [
		self tempVarAccessed: offset + 1].
	^ super pushTemporaryVariable: offset