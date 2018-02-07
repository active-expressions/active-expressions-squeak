change detection
unmonitorInstVars: objectInstVarCollection

	objectInstVarCollection do: [:assoc |
		assoc key unsubscribe: self fromAssignmentNotificationsFor: assoc value]