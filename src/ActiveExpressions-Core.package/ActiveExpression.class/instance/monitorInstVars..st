change detection
monitorInstVars: objectInstVarsDict

	objectInstVarsDict keysAndValuesDo: [:object :instVars |
		instVars do: [:instVar | object 
										onChangeOfInstVarNamed: instVar
										notify: self
										using: #variable:of:changedTo:]]