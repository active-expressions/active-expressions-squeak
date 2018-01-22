rewriting
rewrite: source in: class

	| parseTree |
	parseTree := RBParser parseMethod: source.
	parseTree nodesDo: [:node |
		node isAssignment ifTrue: [
			| newNode newExpression variableName assignmentValue |
			variableName := node variable name.
			(((class monitoredInstVarNames includes: node variable name) 
			and: [(node temporaryVariables includes: variableName) not])
			and: [(node blockVariables includes: variableName) not]) ifTrue: [
				assignmentValue := node source copyFrom: node value start to: node value stop.
				newExpression := 'self monitoredInstVarNamed: ''' , variableName , ''' put: (' , assignmentValue , ')'.
				newNode := RBParser parseExpression: newExpression.
				node parent replaceNode: node withNode: newNode]]].
	^ parseTree printString