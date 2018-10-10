instruction decoding
pushLiteralVariable: anAssociation

	anAssociation isSubscriptionsBinding ifFalse: [
		litVarAccesses add: anAssociation].
	^ super pushLiteralVariable: anAssociation