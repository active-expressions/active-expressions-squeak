rewriting
rewrite: source variables: variables class: class

	| parseTree |
	parseTree := RBParser parseMethod: source.
	parseTree nodesDo: [:parent |
		parent children do: [:node |
			node isAssignment ifTrue: [
				| variableName |
				variableName := node variable name.
				(((variables includes: variableName) 
				and: [(node temporaryVariables includes: variableName) not])
				and: [(node blockVariables includes: variableName) not]) ifTrue: [
					node replaceWith: (self constructMessageNodeFor: node)]]]].
	^ parseTree printString