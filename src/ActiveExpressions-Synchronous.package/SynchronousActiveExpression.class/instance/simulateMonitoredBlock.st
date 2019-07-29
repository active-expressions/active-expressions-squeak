change detection
simulateMonitoredBlock

	[^ AxSimulator new
		simulate: self monitoredBlock;
		yourself]
			on: Error
			do: [^ nil]