change detection
classesNotToMonitor
	"An (incomplete) collection of classes that should not be monitored, either because they are value objects or because it could break."
	^ { self class . BlockClosure . Point . Rectangle . Color . }