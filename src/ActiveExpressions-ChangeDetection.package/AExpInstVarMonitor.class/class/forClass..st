accessing instances
forClass: aClass

	^ self instanceDict at: aClass ifAbsentPut: [self new setMonitoredClass: aClass]