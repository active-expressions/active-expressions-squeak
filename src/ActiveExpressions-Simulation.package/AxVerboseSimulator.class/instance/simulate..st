as yet unclassified
simulate: aBlock

	| topContext |
	aBlock hasMethodReturn
		ifTrue: [self error: 'simulation of blocks with ^ can run loose'].
	topContext := thisContext.
	depth := 0.
	currentContext := aBlock asContext.
	currentContext pushArgs: Array new from: topContext.
	Transcript nextPutAll: '#################################'; cr.
	self logContext: currentContext.
	[currentContext == topContext]
		whileFalse:
			[| previousContext previousDepth |
			previousContext := currentContext.
			previousDepth := depth.
			currentContext := currentContext interpretNextInstructionFor: self.
			depth := self distanceFrom: topContext to: currentContext.
			(previousContext ~~ currentContext and: [previousDepth < depth]) ifTrue: [
				self logContext: currentContext]].
	result := topContext pop.
	Transcript flush