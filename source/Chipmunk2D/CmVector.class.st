Class {
	#name : #CmVector,
	#superclass : #CmExternalStructure,
	#classVars : [
		'OFFSET_X',
		'OFFSET_Y'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #'field definition' }
CmVector class >> fieldsDesc [

	^#(
		cpFloat x; 
		cpFloat y
	)
]

{ #category : #'Instance Creation' }
CmVector class >> from: anObject [

	^ anObject asCmVector
]

{ #category : #'Instance Creation' }
CmVector class >> fromPoint: aPoint [

	^ self x: aPoint x asFloat y: aPoint y asFloat
]

{ #category : #'Instance Creation' }
CmVector class >> x: xFloat y: yFloat [

	^ self new
		x: xFloat;
		y: yFloat;
		yourself
]

{ #category : #'Instance Creation' }
CmVector class >> zero [

	^ self x: 0.0 y: 0.0
]

{ #category : #'Basic Operations' }
CmVector >> + aCmVector [

	^ CmVector x: self x + aCmVector x y: self y + aCmVector y
]

{ #category : #'Basic Operations' }
CmVector >> - aCmVector [

	^ CmVector x: self x - aCmVector x y: self y - aCmVector y
]

{ #category : #Converting }
CmVector >> asCmVector [

	^ self
]

{ #category : #Converting }
CmVector >> asPoint [

	^ self x @ self y
]

{ #category : #'Basic Operations' }
CmVector >> rotateBy: aCmVector [

	"rotate self by aCmVector "

	^ CmVector
		x: self x * aCmVector x - ( self y * aCmVector y )
		y: self x * aCmVector y + ( self y * aCmVector x )
]

{ #category : #Accessing }
CmVector >> x [

	"This method was automatically generated"

	^ handle floatAt: 1
]

{ #category : #Accessing }
CmVector >> x: anObject [

	"This method was automatically generated"

	handle floatAt: 1 put: anObject
]

{ #category : #Accessing }
CmVector >> y [

	"This method was automatically generated"

	^ handle floatAt: 5
]

{ #category : #Accessing }
CmVector >> y: anObject [

	"This method was automatically generated"

	handle floatAt: 5 put: anObject
]
