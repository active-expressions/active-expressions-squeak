baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			package: 'ActiveExpressions-Core';
			package: 'ActiveExpressions-Tests' with: [spec requires: #('Core')].
		spec
			group: 'Core' with: #('ActiveExpressions-Core');
			group: 'Tests' with: #('ActiveExpressions-Tests');
			group: 'default' with: #('Core' 'Tests');
			group: 'CompleteWithoutTests' with: #('Core');
			group: 'CompleteWithTests' with: #('CompleteWithoutTests' 'Tests')]
