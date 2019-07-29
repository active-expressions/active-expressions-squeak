private
updateSubscriptions: aSimulator

	aSimulator litVarAccesses do: [:binding |
		VarTra
			subscribe: self
			toLitVar: binding].
	aSimulator instVarAccesses keysAndValuesDo: [:object :instVars |
		| instVarNames |
		instVarNames := object class allInstVarNames.
		instVars do: [:offset |
			VarTra
				subscribe: self
				toInstVarNamed: (instVarNames at: offset + 1)
				ofObject: object]].
	aSimulator tempVarAccesses do: [:tempAccess |
		VarTra
			subscribe: self
			toTempVarNamed: (self tempNameMap at: tempAccess)
			ofContext: self monitoredBlock home]