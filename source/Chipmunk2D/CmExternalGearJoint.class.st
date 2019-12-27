Class {
	#name : #CmExternalGearJoint,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalGearJoint >> phase [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpGearJointGetPhase( self ))
]

{ #category : #Accessing }
CmExternalGearJoint >> ratio [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpGearJointGetRatio( self ))
]
