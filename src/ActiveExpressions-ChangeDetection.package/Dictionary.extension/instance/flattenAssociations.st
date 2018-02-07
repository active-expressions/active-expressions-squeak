*ActiveExpressions-ChangeDetection
flattenAssociations
	"Assumes all values are collections. Answers a collection of associations consisting of each key associated with every element of its value. E.g. {1->{2 . 3} . 4->{5}} is turned into {1->2 . 1->3 . 4->5}"
	| result |
	result := OrderedCollection new.
	self associationsDo: [:assoc |
		assoc value isCollection ifFalse: [self error: 'value must be a collection'].
		assoc value do: [:elem |
			result add: (assoc key -> elem)]].
	^ result