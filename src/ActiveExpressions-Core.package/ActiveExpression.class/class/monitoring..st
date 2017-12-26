instance creation
monitoring: aBlock

	^ self basicNew 
			setMonitoredBlock: aBlock;
			initialize