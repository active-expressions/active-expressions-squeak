instruction decoding
jump: offset
	"Unconditional Jump bytecode."
	^ currentContext jump: offset