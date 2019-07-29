variable subscriptions
generateTempNameMap

	| blockExtentMap blockExtent tempsMap |
	blockExtentMap := self monitoredBlock homeMethod startKeysToBlockExtents.
	blockExtent := blockExtentMap at: self monitoredBlock startpc.
	tempsMap := self monitoredBlock homeMethod blockExtentsToTempsMap.
	^ (tempsMap at: blockExtent)
		collect: [:temp | (temp second) -> (temp first)]
		as: Dictionary