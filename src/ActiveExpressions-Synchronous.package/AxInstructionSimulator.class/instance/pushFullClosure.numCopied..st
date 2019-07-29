instruction decoding
pushFullClosure: aCompiledBlock numCopied: numCopied
	"Push Full Closure bytecode."
	^ currentContext pushFullClosure: aCompiledBlock numCopied: numCopied