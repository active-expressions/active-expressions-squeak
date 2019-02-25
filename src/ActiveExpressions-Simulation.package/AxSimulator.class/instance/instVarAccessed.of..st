accessing
instVarAccessed: offset of: receiver
	"Remembers inst var accesses as offsets instead of variable names to avoid building the complete list of variable names each time."
	(self instVarAccesses
		at: receiver
		ifAbsentPut: [IdentitySet new]) add: offset.