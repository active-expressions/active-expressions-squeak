*ActiveExpressions-ChangeDetection
onChangeOfInstVarNamed: variableName notify: anObject using: selector

	self class instVarMonitor 
		subscribe: anObject
		toVariable: variableName
		of: self
		selector: selector