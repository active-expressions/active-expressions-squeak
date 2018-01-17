change detection
installMonitors

	| instVarsToMonitor |
	instVarsToMonitor := self instVarsToMonitor.
	self monitorInstVars: instVarsToMonitor.
	self monitoredInstVars: instVarsToMonitor.