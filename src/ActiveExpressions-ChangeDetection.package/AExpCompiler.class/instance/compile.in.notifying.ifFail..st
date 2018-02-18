public access
compile: textOrStream in: aClass notifying: aRequestor ifFail: failBlock

	| newCode |
	newCode := self 
					rewrite: textOrStream 
					variables: aClass monitoredInstVarNames 
					class: aClass.
	
	^ super compile: newCode in: aClass notifying: aRequestor ifFail: failBlock