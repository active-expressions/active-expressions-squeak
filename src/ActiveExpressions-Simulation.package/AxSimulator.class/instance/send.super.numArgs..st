instruction decoding
send: selector super: supered numArgs: numberArguments
	"Probe for return fields (quick methods)"
	numberArguments = 0 ifTrue: [
		| receiver nextMethod |
		receiver := currentContext at: (currentContext stackPtr - numberArguments).
		nextMethod := receiver class lookupSelector: selector.
		nextMethod isReturnField ifTrue: [
			self instVarAccessed: nextMethod returnField of: receiver]].	
	^ super send: selector super: supered numArgs: numberArguments