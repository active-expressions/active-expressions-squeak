accessing
instVarAccessed: offset of: receiver

	(instVarAccesses
		at: receiver
		ifAbsentPut: [IdentitySet new]) add: offset.