Class {
	#name : #CmBoundingBox,
	#superclass : #CmExternalStructure,
	#classVars : [
		'OFFSET_B',
		'OFFSET_L',
		'OFFSET_R',
		'OFFSET_T'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #'field definition' }
CmBoundingBox class >> fieldsDesc [

	^#(
		cpFloat l; 
		cpFloat b; 
		cpFloat r;
		cpFloat t;
	)
]

{ #category : #'Instance Creation' }
CmBoundingBox class >> from: anObject [

	^ anObject asCmBoundingBox
]

{ #category : #'Instance Creation' }
CmBoundingBox class >> fromRectangle: aRect [

	^ self new
		t: aRect top;
		l: aRect left;
		b: aRect bottom;
		r: aRect right;
		yourself
]

{ #category : #converting }
CmBoundingBox >> asCmBoundingBox [

	^ self
]

{ #category : #Accessing }
CmBoundingBox >> b [

	"This method was automatically generated"

	^ handle floatAt: 5
]

{ #category : #Accessing }
CmBoundingBox >> b: anObject [

	"This method was automatically generated"

	handle floatAt: 5 put: anObject
]

{ #category : #Accessing }
CmBoundingBox >> l [

	"This method was automatically generated"

	^ handle floatAt: 1
]

{ #category : #Accessing }
CmBoundingBox >> l: anObject [

	"This method was automatically generated"

	handle floatAt: 1 put: anObject
]

{ #category : #Accessing }
CmBoundingBox >> r [

	"This method was automatically generated"

	^ handle floatAt: 9
]

{ #category : #Accessing }
CmBoundingBox >> r: anObject [

	"This method was automatically generated"

	handle floatAt: 9 put: anObject
]

{ #category : #Accessing }
CmBoundingBox >> t [

	"This method was automatically generated"

	^ handle floatAt: 13
]

{ #category : #Accessing }
CmBoundingBox >> t: anObject [

	"This method was automatically generated"

	handle floatAt: 13 put: anObject
]
