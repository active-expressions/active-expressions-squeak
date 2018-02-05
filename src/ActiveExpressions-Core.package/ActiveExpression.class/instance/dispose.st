initialize-release
dispose
	"Assures that all changes made in the system by this ActiveExpression are reverted. Disables all callbacks. Releases all references. The ActiveExpression should not be used afterwards."
	callbacks := nil.
	monitoredBlock := nil.
	lastValue := nil.
	callbacksEnabled := false