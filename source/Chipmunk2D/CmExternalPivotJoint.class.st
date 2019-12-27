Class {
	#name : #CmExternalPivotJoint,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalPivotJoint >> anchr1 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpPivotJointGetAnchorA( self ))
]

{ #category : #Accessing }
CmExternalPivotJoint >> anchr2 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpPivotJointGetAnchorB( self ))
]
