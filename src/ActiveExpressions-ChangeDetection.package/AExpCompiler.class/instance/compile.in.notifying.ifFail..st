public access
compile: textOrStream in: aClass notifying: aRequestor ifFail: failBlock

	| newCode rewriter grammar |
	rewriter := (OhmSmalltalk synthesizedAttribute: AExpInstanceVariableAssignmentRewriter new).
	rewriter variablesToBeReplaced: ((aClass monitoredInstVarNames) collect: [:s | s asSymbol]).
	
	grammar := OhmSmalltalk match: textOrStream asString startingFrom: #MethodDeclaration.
	[newCode := rewriter value: (grammar).
	newCode := self format: newCode in: aClass notifying: nil] 
		on: Error 
		do: [newCode := textOrStream].
	
	^ super compile: newCode in: aClass notifying: aRequestor ifFail: failBlock