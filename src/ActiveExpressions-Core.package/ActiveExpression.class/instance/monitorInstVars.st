change detection
monitorInstVars

	self instVarsToMonitor keysAndValuesDo: [:object :variables |
		variables do: [:variableName | object 
										onChangeOfInstVarNamed: variableName
										notify: self
										using: #variable:of:changedTo:]]