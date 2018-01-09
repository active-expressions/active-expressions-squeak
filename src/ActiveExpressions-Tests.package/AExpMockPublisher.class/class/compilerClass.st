compiling
compilerClass

	^ self hasMonitoredVariables
		ifTrue: [AExpCompiler]
		ifFalse: [Compiler]