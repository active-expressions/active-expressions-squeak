private
removeObsoleteSubscriptions

	self allSubscriptions do: [:subscription |
		subscription do: [:publisher :subscriber | "do nothing"]]