instruction decoding
pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex

	currentContext == topContext ifTrue: [
		self tempVarAccessed: { tempVectorIndex + 1 . remoteTempIndex + 1 }].
	^ super pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex