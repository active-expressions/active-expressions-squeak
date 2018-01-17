running
setUp

	publisher := AExpMockPublisher new.
	lastValue := 100.
	value := self newValue.
	callbackCount := 0.
	callback := [callbackCount := callbackCount + 1]