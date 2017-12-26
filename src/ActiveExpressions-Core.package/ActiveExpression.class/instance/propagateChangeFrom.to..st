change
propagateChangeFrom: oldValue to: newValue

	self callbacksEnabled ifTrue: [
		self callbacks do: [:each | self invokeCallback: each oldValue: oldValue newValue: newValue]]