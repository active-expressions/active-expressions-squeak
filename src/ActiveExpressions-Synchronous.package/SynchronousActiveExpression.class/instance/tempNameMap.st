accessing
tempNameMap

	^ tempNameMap ifNil: [tempNameMap := self generateTempNameMap]