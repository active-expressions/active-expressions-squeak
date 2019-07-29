testing
trackingEnabled

	| activeLayers |
	activeLayers := thisContext activeLayers.
	^ self layers anySatisfy: [:layer | activeLayers includes: layer]