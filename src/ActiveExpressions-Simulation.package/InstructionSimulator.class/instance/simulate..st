initialize-release
simulate: aBlock

	| topContext |
	aBlock hasMethodReturn
		ifTrue: [self error: 'simulation of blocks with ^ can run loose'].
	topContext := thisContext.
	currentContext := aBlock asContext.
	currentContext pushArgs: Array new from: topContext.
	[currentContext == topContext]
		whileFalse:
			[currentContext := currentContext interpretNextInstructionFor: self].
	^ topContext pop