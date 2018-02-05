*ActiveExpressions-ChangeDetection
onChangeOfInstVarNamed: variableName notify: anObject

	self class instVarMonitor 
		subscribe: anObject
		toVariable: variableName
		of: self