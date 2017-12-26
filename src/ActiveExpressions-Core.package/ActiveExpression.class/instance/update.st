change
update

	| newValue oldValue |
	oldValue := self lastValue.
	newValue := self currentValue.
	oldValue ~~ newValue ifTrue: [
		self setLastValue: newValue.
		self propagateChangeFrom: oldValue to: newValue]