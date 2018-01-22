baseline
baseline: spec
	<baseline>
	spec for: #common do: [
		spec
			project: 'RefactoringBrowser' with: [
				spec
					className: 'ConfigurationOfRefactoringBrowser';
					versionString: #'stable';
					loads: #( 'Core' );
					repository: 'http://www.squeaksource.com/MetacelloRepository'].
		spec
			package: 'ActiveExpressions-ChangeDetection' with: [
				spec requires: #('RefactoringBrowser')];
			package: 'ActiveExpressions-Core' with: [
				spec requires: #('ChangeDetection')];
			package: 'ActiveExpressions-Tests' with: [
				spec requires: #('Core')].
		spec
			group: 'Core' with: #('ActiveExpressions-Core');
			group: 'ChangeDetection' with: #('ActiveExpressions-ChangeDetection');
			group: 'Tests' with: #('ActiveExpressions-Tests');
			group: 'default' with: #('Core' 'ChangeDetection' 'Tests');
			group: 'CompleteWithoutTests' with: #('Core' 'ChangeDetection');
			group: 'CompleteWithTests' with: #('CompleteWithoutTests' 'Tests')]
