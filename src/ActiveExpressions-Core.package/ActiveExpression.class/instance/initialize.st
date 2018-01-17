initialize-release
initialize

	super initialize.
	self setLastValue: self currentValue.
	self installMonitors