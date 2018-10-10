instruction decoding
jump: offset if: condition 
	"Conditional Jump bytecode."
	^ currentContext jump: offset if: condition