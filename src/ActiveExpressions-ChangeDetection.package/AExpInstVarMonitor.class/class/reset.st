accessing
reset

	self instanceDict valuesDo: [:instance | instance unsubscribeAll].
	InstanceDict := nil.