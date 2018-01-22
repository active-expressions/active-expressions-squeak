public access
compile: textOrStream in: aClass notifying: aRequestor ifFail: failBlock

	| newCode |
	newCode := self rewrite: textOrStream in: aClass.
	
	^ super compile: newCode in: aClass notifying: aRequestor ifFail: failBlock