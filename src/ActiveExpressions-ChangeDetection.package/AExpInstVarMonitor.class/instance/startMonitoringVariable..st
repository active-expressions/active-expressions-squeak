private
startMonitoringVariable: variableName

	self subscriptions at: variableName asSymbol put: AExpOrderedCollection new.
	self recompileMonitoredClass