following
startFollowing: aMorph

	self stopFollowing.
	self setActiveExpression: ([aMorph bounds] onChangeDo: [:bounds | self followTo: bounds]).
	self activeExpression uninstallMonitors