*ActiveExpressions-ChangeDetection
compilerClass

	^ Compiler
	"^ self hasMonitoredVariables
		ifTrue: [AExpCompiler]
		ifFalse: [Compiler]"