testing
variableComesFromSuperclass: variableName

	^ (self monitoredClass hasInstVarNamed: variableName) not