change detection
monitorInstVars: objectInstVarCollection

	objectInstVarCollection do: [:assoc |
		assoc key onChangeOfInstVarNamed: assoc value notify: self]