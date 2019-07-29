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
			package: 'ActiveExpressions-ChangeDetection' with: [
				spec requires: #('RefactoringBrowser')];
			package: 'ActiveExpressions-Core' with: [
				spec requires: #('ChangeDetection')];
			package: 'ActiveExpressions-Tests' with: [
				spec requires: #('Core')];
			package: 'ActiveExpressions-Examples' with: [
				spec requires: #('Core' 'ChangeDetection')].
		spec
			group: 'Core' with: #('ActiveExpressions-Core');
			group: 'ChangeDetection' with: #('ActiveExpressions-ChangeDetection');
			group: 'Examples' with: #('ActiveExpressions-Examples');
			group: 'Tests' with: #('ActiveExpressions-Tests');
			group: 'default' with: #('Core' 'ChangeDetection' 'Tests' 'Examples');
			group: 'CompleteWithoutTests' with: #('Core' 'ChangeDetection' 'Examples');
			group: 'CompleteWithTests' with: #('CompleteWithoutTests' 'Tests')]
