Class {
	#name : #CmExternalSlideJoint,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalSlideJoint >> anchr1 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpSlideJointGetAnchorA( self ))
]

{ #category : #Accessing }
CmExternalSlideJoint >> anchr2 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpSlideJointGetAnchorB( self ))
]

{ #category : #Accessing }
CmExternalSlideJoint >> max [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpSlideJointGetMax( self ))
]

{ #category : #Accessing }
CmExternalSlideJoint >> min [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpSlideJointGetMin( self ))
]
