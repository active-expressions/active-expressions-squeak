private
stopMonitoringVariable: variableName

	self subscriptions removeKey: variableName asSymbol.
	self recompileMonitoredClass