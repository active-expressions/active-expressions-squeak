change detection
unmonitorInstVars: objectInstVarsDict

	objectInstVarsDict keysAndValuesDo: [:object :instVars |
		instVars do: [:instVar | 
			object unsubscribe: self fromAssignmentNotificationsFor: instVar]]