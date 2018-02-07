tests
testContextMethodsAreNotRewritten
	"At the point of rewriting the source code (to intercept all instance variable assignments), there may be methods whose old (and therefor not rewritten) version is already in execution. Since the respective contexts do not adopt the new version, all instance variable assignments made in these contexts remain undetected."
	| wasCalled |
	self instVar: 0.
	wasCalled := false.
	aexp := MonitoringActiveExpression monitoring: [self instVar].
	aexp onChangeDo: [wasCalled := true].
	instVar := 1. "This line should be rewritten"
	self assert: wasCalled.
	