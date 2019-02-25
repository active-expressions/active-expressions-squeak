as yet unclassified
send: selector super: supered numArgs: numberArguments

	| receiver nextMethod |
	receiver := currentContext at: (currentContext stackPtr - numberArguments).
	nextMethod := receiver class lookupSelector: selector.
	nextMethod primitive > 0 ifTrue: [
		(depth + 1) * 2 timesRepeat: [Transcript space].
		Transcript nextPutAll: receiver class name.
		nextMethod methodClass ~~ receiver class ifTrue:
			[Transcript nextPut: $(; nextPutAll: nextMethod methodClass name; nextPut: $)].
		Transcript nextPutAll: '>>'; nextPutAll: nextMethod selector; cr].
	^ super send: selector super: supered numArgs: numberArguments