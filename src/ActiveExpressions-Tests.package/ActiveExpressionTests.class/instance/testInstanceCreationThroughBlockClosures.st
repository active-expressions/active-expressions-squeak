tests
testInstanceCreationThroughBlockClosures

	| aexp |
	aexp := expression onChangeDo: callback.
	self assert: ActiveExpression equals: aexp class.
	aexp dispose