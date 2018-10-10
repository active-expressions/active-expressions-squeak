tests
testContextMethodsTempVarsAreNotRewritten
	"At the point of rewriting the source code, the method the ActiveExpression's monitoredBlock references (through its outherContext) is already in execution. If there are references to temporary variables in the monitoredBlock, then all assignments to them would have to be rewritten. But since said method is already in execution, no temporary variables assignments are actually rewritten."
	| wasCalled tempVar |
	tempVar := 0.
	wasCalled := false.
	aexp := VarTraActiveExpression monitoring: [tempVar].
	aexp onChangeDo: [wasCalled := true].
	tempVar := 1. "This line should be rewritten"
	self assert: wasCalled.
	