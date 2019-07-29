instruction decoding
pushReceiverVariable: offset

	self instVarAccessed: offset of: currentContext receiver.
	^ super pushReceiverVariable: offset