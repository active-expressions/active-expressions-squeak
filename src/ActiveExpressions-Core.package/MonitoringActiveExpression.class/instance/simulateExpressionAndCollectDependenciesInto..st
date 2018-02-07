change detection
simulateExpressionAndCollectDependenciesInto: aDictionary

	^ thisContext 
		runSimulated: [monitoredBlock value]
		contextAtEachStep: [:context |
			context receiver ~= self ifTrue: [
				| nextMethod nextInstruction |
				nextInstruction := context peekInstruction.
				(nextInstruction selector == #send:super:numArgs:) ifTrue: [
					| numArgs receiver selector |
					numArgs := nextInstruction arguments at: 3.
					receiver := context at: (context stackPtr - numArgs).
					(self shouldNotMonitorClass: receiver class) ifFalse: [
						selector := nextInstruction arguments at: 1.
						nextMethod :=  receiver class lookupSelector: selector.
						nextMethod isReturnField ifTrue: [
							| foundVars instVarIndex instVarNames |
							instVarNames := nextMethod methodClass allInstVarNames.
							instVarIndex := nextMethod returnField.
							foundVars := aDictionary at: receiver ifAbsentPut: [Set new].
							foundVars add: (instVarNames at: instVarIndex + 1)]]] ifFalse: [
				((self instVarOperations includes: nextInstruction selector) 
				and: [(self shouldNotMonitorClass: context receiver class) not]) ifTrue: [
					| instVarIndex instVarNames foundVars |
					instVarIndex := nextInstruction argument + 1.
					instVarNames :=context receiver class allInstVarNames.
					foundVars := aDictionary at: context receiver ifAbsentPut: [Set new].
					foundVars add: (instVarNames at: instVarIndex)]]]]