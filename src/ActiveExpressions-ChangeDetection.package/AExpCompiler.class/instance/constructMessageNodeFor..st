rewriting
constructMessageNodeFor: assignmentNode

	| variableName value |
	variableName := assignmentNode variable name.
	value := assignmentNode value.
	^ RBMessageNode 
		receiver: (RBVariableNode named: 'self')
		selector: #monitoredInstVarNamed:put:
		arguments: (Array 
					with: (RBLiteralNode literalToken: (RBLiteralToken 
														value: variableName 
														start: nil 
														stop: nil)) 
					with: value).