rewriting
replaceInstanceVariableWriteFor: aVariableName withValue: aValueExpression

	^ '(self monitoredInstVarNamed: (#' , aVariableName asString , ') put: (' , aValueExpression , '))'