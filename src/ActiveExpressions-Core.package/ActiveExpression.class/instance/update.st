change
update

	| newValue oldValue |
	oldValue := self lastValue.
	newValue := self currentValue.
	oldValue ~~ newValue ifTrue: [
		self setLastValue: newValue.
		self callbacks do: [:each | self invokeCallback: each lastValue: oldValue newValue: newValue]]