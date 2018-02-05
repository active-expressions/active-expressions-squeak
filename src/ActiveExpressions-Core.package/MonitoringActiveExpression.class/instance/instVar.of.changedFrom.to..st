change detection
instVar: variableName of: aMonitoredObject changedFrom: oldValue to: newValue

	self updateMonitors.
	self update