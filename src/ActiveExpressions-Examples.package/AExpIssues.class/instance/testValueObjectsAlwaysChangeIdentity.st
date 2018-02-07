tests
testValueObjectsAlwaysChangeIdentity
	"Value objects are usually treated as being identical to each other, so long as they are equal to each other. This is not reflected in their #== comparator, which causes the 'same' value object to be seen by an ActiveExpression as being a change in state."
	aexp := ActiveExpression monitoring: [1@1]. "This expression never really changes state."
	aexp onChangeDo: [self fail]. "Therefor, this should never be executed."
	aexp update. "But it is..."