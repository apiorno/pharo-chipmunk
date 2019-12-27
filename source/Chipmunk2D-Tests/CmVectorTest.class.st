Class {
	#name : #CmVectorTest,
	#superclass : #TestCase,
	#category : #'Chipmunk2D-Tests'
}

{ #category : #tests }
CmVectorTest >> testAccessing [

	| vector |

	vector := CmVector x: 1.0 y: 2.0.
	self
		assert: vector x equals: 1.0;
		assert: vector y equals: 2.0.
	vector
		x: 2.0;
		y: 1.0.
	self
		assert: vector x equals: 2.0;
		assert: vector y equals: 1.0
]

{ #category : #tests }
CmVectorTest >> testConverting [

	| vector convertedVector point |

	point := 1.0 @ 2.0.
	vector := CmVector fromPoint: point.
	convertedVector := vector asCmVector.
	self assert: convertedVector equals: vector.
	convertedVector := vector asPoint.
	self assert: convertedVector equals: point
]

{ #category : #tests }
CmVectorTest >> testRotate [

	| vector anotherVector rotatedVector |

	vector := CmVector x: 1.0 y: 2.0.
	anotherVector := CmVector x: 2.0 y: 2.0.
	rotatedVector := vector rotateBy: anotherVector.
	self
		assert: rotatedVector x equals: 2.0 negated;
		assert: rotatedVector y equals: 6.0
]
