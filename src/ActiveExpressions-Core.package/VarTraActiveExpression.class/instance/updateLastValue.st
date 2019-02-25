change detection
updateLastValue

	| simulator |
	simulator := AxSimulator new.
	[simulator simulate: [monitoredBlock value].
	self updateSubscriptions: simulator]
		on: Error
		do: [^ self].
	self setLastValue: simulator result