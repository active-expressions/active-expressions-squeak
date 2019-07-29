instruction decoding
pushLiteralVariable: anAssociation

	anAssociation isSubscriptionsBinding ifFalse: [
		self litVarAccesses add: anAssociation].
	^ super pushLiteralVariable: anAssociation