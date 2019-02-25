instruction decoding
send: selector super: supered numArgs: numberArguments
	"Probe for selectors which should not be simulated. Step over them. This has to be quick, so it was optimized for speed at the cost of code cleanliness."
	selector == #notify:instVarNamed:ofObject:changedFrom:to:inContext: ifTrue: [
		6 timesRepeat: [currentContext pop]. ^ currentContext].
	(selector == #notify:litVar:changedFrom:to:inContext:
		or: [selector == #notify:tempVarNamed:changedFrom:to:inContext:]) ifTrue: [
		5 timesRepeat: [currentContext pop]. ^ currentContext].
	"Probe for return fields (quick methods)"
	numberArguments = 0 ifTrue: [
		| receiver nextMethod |
		receiver := currentContext at: (currentContext stackPtr - numberArguments).
		nextMethod := receiver class lookupSelector: selector.
		nextMethod isReturnField ifTrue: [
			self instVarAccessed: nextMethod returnField of: receiver]].	
	^ super send: selector super: supered numArgs: numberArguments