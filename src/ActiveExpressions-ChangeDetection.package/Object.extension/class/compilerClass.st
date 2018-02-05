*ActiveExpressions-ChangeDetection
compilerClass

	^ self hasMonitoredVariables
		ifTrue: [AExpCompiler]
		ifFalse: [Compiler]