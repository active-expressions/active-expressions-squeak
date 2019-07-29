utility
simulate: aBlock log: aStream

	| simulationContext depth |
	aBlock hasMethodReturn
		ifTrue: [self error: 'simulation of blocks with ^ can run loose']. "could probably be solved by guarding method returns"
	simulationContext := thisContext.
	currentContext := topContext := aBlock asContext.
	currentContext pushArgs: Array new from: simulationContext.
	aStream nextPutAll: '#################################'; cr.
	self logContext: currentContext stream: aStream offset: (depth := 0).
	[currentContext == simulationContext] whileFalse: [
		| previousContext previousDepth |
		previousContext := currentContext.
		previousDepth := depth.
		currentContext := currentContext interpretNextInstructionFor: self.
		depth := currentContext depthBelow: topContext.
		(previousDepth < depth and: [currentContext ~~ simulationContext]) ifTrue: [
			self logContext: currentContext stream: aStream offset: depth]].
	result := simulationContext pop.
	aStream flush