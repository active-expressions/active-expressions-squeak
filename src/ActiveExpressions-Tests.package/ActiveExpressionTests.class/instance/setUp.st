running
setUp

	value := 42.
	callbackCount := 0.
	activeExpression := ActiveExpression monitoring: [value].
	activeExpression onChangeDo: [callbackCount := callbackCount + 1]