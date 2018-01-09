*ActiveExpressions-ChangeDetection
monitoredInstVarNamed: variableName put: anObject

	self instVarNamed: variableName put: anObject.
	self class instVarMonitor variable: variableName of: self changedTo: anObject.
	^ anObject