running
setUp

	lastValue := 100.
	value := self newValue.
	expression := [value].
	callbackCount := 0.
	callback := [callbackCount := callbackCount + 1].
	activeExpression := ActiveExpression monitoring: expression.
	activeExpression onChangeDo: callback