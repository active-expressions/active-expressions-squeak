change detection
updateMonitorsTo: variables

	| instVarsToAdd instVarsToRemove |
	instVarsToAdd := variables reject: [:new |
		self monitoredInstVars anySatisfy: [:old | 
			new identicalKeyAndValue: old]].
	instVarsToRemove := self monitoredInstVars reject: [:old |
		variables anySatisfy: [:new |
			new identicalKeyAndValue: old]].
	self monitorInstVars: instVarsToAdd.
	self unmonitorInstVars: instVarsToRemove.
	self monitoredInstVars: variables