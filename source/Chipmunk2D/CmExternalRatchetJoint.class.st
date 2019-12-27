Class {
	#name : #CmExternalRatchetJoint,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalRatchetJoint >> angle [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpRatchetJointGetAngle( self ))
]

{ #category : #Accessing }
CmExternalRatchetJoint >> phase [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpRatchetJointGetPhase( self ))
]

{ #category : #Accessing }
CmExternalRatchetJoint >> ratchet [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpRatchetJointGetRatchet( self ))
]
