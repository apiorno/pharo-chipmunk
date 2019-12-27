Class {
	#name : #CmBoundingBoxTest,
	#superclass : #TestCase,
	#category : #'Chipmunk2D-Tests'
}

{ #category : #tests }
CmBoundingBoxTest >> testAccessing [

	| boundingBox |

	boundingBox := CmBoundingBox fromRectangle: ( 2.0 @ 2.0 extent: 5.0 @ 5.0 ).
	self
		assert: boundingBox t equals: 2.0;
		assert: boundingBox b equals: 7.0;
		assert: boundingBox l equals: 2.0;
		assert: boundingBox r equals: 7.0
]

{ #category : #tests }
CmBoundingBoxTest >> testConverting [

	| boundingBox newBoundingBox |

	boundingBox := CmBoundingBox fromRectangle: ( 2.0 @ 2.0 extent: 5.0 @ 5.0 ).
	newBoundingBox := boundingBox asCmBoundingBox.
	self assert: newBoundingBox equals: boundingBox
]

{ #category : #tests }
CmBoundingBoxTest >> testConvertingFromRectangle [

	| boundingBox rectangle newBoundingBox |

	rectangle := 2.0 @ 2.0 extent: 5.0 @ 5.0.
	boundingBox := CmBoundingBox fromRectangle: rectangle.
	newBoundingBox := rectangle asCmBoundingBox.
	self
		assert: newBoundingBox b equals: boundingBox b;
		assert: newBoundingBox l equals: boundingBox l;
		assert: newBoundingBox r equals: boundingBox r;
		assert: newBoundingBox t equals: boundingBox t
]
