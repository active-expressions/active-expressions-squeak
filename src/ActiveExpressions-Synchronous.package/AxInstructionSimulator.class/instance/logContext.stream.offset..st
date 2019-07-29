utility
logContext: aContext stream: aStream offset: offset

	offset * 2 timesRepeat: [aStream space].
	aContext printOn: aStream.
	aStream
		cr;
		flush