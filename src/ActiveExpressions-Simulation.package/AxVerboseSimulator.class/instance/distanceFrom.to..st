as yet unclassified
distanceFrom: topContext to: bottomContext

	| c distance |
	distance := 0.
	c := bottomContext.
	[c ~~ nil]
		whileTrue:
			[c == topContext
				ifTrue: [^ distance]
				ifFalse: 
					[distance := distance + 1.
					c := c sender]].
	self error: 'topContext is not in the sender chain of bottomContext'