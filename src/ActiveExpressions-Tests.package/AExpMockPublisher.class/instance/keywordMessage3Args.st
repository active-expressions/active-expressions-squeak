methods
keywordMessage3Args

	^ self variableOfInterest perform: #ifNil:ifNotNil: with: [nil] with: [:var | var]