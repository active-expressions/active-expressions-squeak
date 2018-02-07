tests
testAtomicOperationsAreNotRespected
	"Objects often have operations they consider to be atomic, where the state in between a few actions is technically undefined but usually also not visible to the outside world. During that short time frame said obejct can make no guarantees as to its correct functioning (e.g. holding its contracts). Installing monitors into such an operation causes us to try to use the object at exactly that point in time."
	stack := OrderedCollection withAll: { 1 . 2 . 3 }.
	stackSize := 3.
	aexp := MonitoringActiveExpression monitoring: [self stackTop].