running
setUp

	value := 42.
	expression := [value].
	callbackCount := 0.
	callback := [callbackCount := callbackCount + 1].
	activeExpression := ActiveExpression monitoring: expression.
	activeExpression onChangeDo: callback