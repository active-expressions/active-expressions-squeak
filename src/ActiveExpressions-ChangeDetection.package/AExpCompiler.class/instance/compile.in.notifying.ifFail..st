public access
compile: textOrStream in: aClass notifying: aRequestor ifFail: failBlock

	| newCode rewriter |
	rewriter := (OhmSmalltalk synthesizedAttribute: AExpInstanceVariableAssignmentRewriter new).
	rewriter variablesToBeReplaced: ((aClass monitoredInstVarNames) collect: [:s | s asSymbol]).
	
	newCode := rewriter value: (OhmSmalltalk match: textOrStream asString startingFrom: #MethodDeclaration).
	
	^ super compile: newCode in: aClass notifying: aRequestor ifFail: failBlock