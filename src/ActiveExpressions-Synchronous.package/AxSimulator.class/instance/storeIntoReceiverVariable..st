instruction decoding
storeIntoReceiverVariable: offset

	self instVarAccessed: offset of: currentContext receiver.
	^ super storeIntoReceiverVariable: offset