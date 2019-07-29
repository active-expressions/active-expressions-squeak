instruction decoding
pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize
	"Push Closure bytecode."
	^ currentContext pushClosureCopyNumCopiedValues: numCopied numArgs: numArgs blockSize: blockSize