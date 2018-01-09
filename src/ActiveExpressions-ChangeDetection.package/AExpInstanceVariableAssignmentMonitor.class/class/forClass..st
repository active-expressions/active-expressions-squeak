accessing instances
forClass: aClass

	^ self instanceDict at: aClass ifAbsentPut: [self new monitoredClass: aClass]