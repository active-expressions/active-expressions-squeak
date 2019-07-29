change detection
updateLastValue

	self trackCurrentDependencies ifNotNil: [:simulation |
		self setLastValue: simulation result]