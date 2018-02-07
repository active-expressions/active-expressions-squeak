change detection
shouldNotMonitorClass: aClass

	(self classesNotToMonitor includes: aClass) ifTrue: [^true].
	^ false