Class {
	#name : #BaselineOfChipmunk2D,
	#superclass : #BaselineOf,
	#category : #BaselineOfChipmunk2D
}

{ #category : #accessing }
BaselineOfChipmunk2D >> baseline: spec [

	<baseline>
	spec
		for: #pharo
		do: [ self setUpPackagesFor: spec.
			self setUpGroupsFor: spec
			]
]

{ #category : #accessing }
BaselineOfChipmunk2D >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #accessing }
BaselineOfChipmunk2D >> setUpGroupsFor: spec [

	^ spec
		group: 'Tests' with: 'Chipmunk2D-Tests';
		group: 'Deployment' with: 'Chipmunk2D';
		group: 'Development' with: #('Deployment' 'Tests');
		group: 'CI' with: 'Tests';
		group: 'default' with: #('Development')
]

{ #category : #accessing }
BaselineOfChipmunk2D >> setUpPackagesFor: spec [

	spec
		package: 'Chipmunk2D';
		package: 'Chipmunk2D-Tests' with: [ spec requires: #('Chipmunk2D') ]
]
