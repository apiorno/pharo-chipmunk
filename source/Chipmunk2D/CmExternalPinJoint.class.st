Class {
	#name : #CmExternalPinJoint,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalPinJoint >> anchr1 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpPinJointGetAnchorA( self ))
]

{ #category : #Accessing }
CmExternalPinJoint >> anchr2 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpPinJointGetAnchorB( self ))
]

{ #category : #Accessing }
CmExternalPinJoint >> dist [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpPinJointGetDist( self ))
]
