running
setUp

	lastValue := 100.
	value := self newValue.
	expression := [value].
	callbackCount := 0.
	callback := [callbackCount := callbackCount + 1].
	activeExpression := self expressionType on: expression.
	activeExpression onChangeDo: callback