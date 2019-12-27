Class {
	#name : #CmExternalRotaryLimitJoint,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalRotaryLimitJoint >> max [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpRotaryLimitJointGetMax( self ))
]

{ #category : #Accessing }
CmExternalRotaryLimitJoint >> min [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpRotaryLimitJointGetMin( self ))
]
