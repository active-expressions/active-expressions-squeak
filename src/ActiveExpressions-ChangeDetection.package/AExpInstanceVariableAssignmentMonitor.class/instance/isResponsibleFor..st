private
isResponsibleFor: aSubscription

	^ aSubscription isObsolete or: [aSubscription publisher class == self monitoredClass]