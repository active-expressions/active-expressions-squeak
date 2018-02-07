change
update

	| newValue oldValue |
	oldValue := self lastValue.
	self updateLastValue.
	newValue := self lastValue.
	oldValue ~~ newValue ifTrue: [
		self propagateChangeFrom: oldValue to: newValue]