installation
install

	super install.
	self expressions do: [:exp | exp install]