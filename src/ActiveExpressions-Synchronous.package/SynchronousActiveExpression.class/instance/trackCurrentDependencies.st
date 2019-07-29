change detection
trackCurrentDependencies

	^ self simulateMonitoredBlock ifNotNil: [:simulation |
		self updateSubscriptions: simulation.
		simulation].