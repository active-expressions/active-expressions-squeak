accessing
do: aBlock
	"Pass weakly referenced objects into aBlock as arguments to prevent the garbage collector from cleaning them up during aBlock."
	| publisher subscriber isObsolete |
	publisher := self publisher.
	subscriber := self subscriber.
	isObsolete := publisher isNil or: [subscriber isNil].
	isObsolete
		ifTrue: [self terminate]
		ifFalse: [aBlock value: publisher value: subscriber].
	^ isObsolete