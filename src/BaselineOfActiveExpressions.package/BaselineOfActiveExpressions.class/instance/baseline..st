baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			baseline: 'VarTra' with: [
				spec repository: 'github://stlutz/VarTra:master/src'];
			baseline: 'DynamicLayers' with: [
				spec repository: 'github://stlutz/DynamicLayers:master/src'].
		spec
			package: 'ActiveExpressions-Core';
			package: 'ActiveExpressions-Synchronous' with: [
				spec requires: #('Core' 'VarTra' 'DynamicLayers')];
			package: 'ActiveExpressions-Tests' with: [
				spec requires: #('Core' 'Synchronous')];
			package: 'ActiveExpressions-Examples' with: [
				spec requires: #('Core' 'Synchronous')].
		spec
			group: 'Core' with: #('ActiveExpressions-Core');
			group: 'Synchronous' with: #('ActiveExpressions-Synchronous');
			group: 'Examples' with: #('ActiveExpressions-Examples');
			group: 'Tests' with: #('ActiveExpressions-Tests');
			group: 'default' with: #('Core' 'Synchronous' 'Tests' 'Examples');
			group: 'CompleteWithoutTests' with: #('Core' 'Synchronous' 'Examples');
			group: 'CompleteWithTests' with: #('CompleteWithoutTests' 'Tests')]
