change detection
uninstallMonitors

	self unmonitorInstVars: self monitoredInstVars.
	self monitoredInstVars: nil