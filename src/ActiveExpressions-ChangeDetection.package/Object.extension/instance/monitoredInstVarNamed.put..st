*ActiveExpressions-ChangeDetection
monitoredInstVarNamed: variableName put: anObject

	| oldValue |
	oldValue := self instVarNamed: variableName.
	self instVarNamed: variableName put: anObject.
	self class instVarMonitor instVar: variableName of: self changedFrom: oldValue to: anObject.
	^ anObject