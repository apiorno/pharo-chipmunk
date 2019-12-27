Class {
	#name : #CmExternalGrooveJoint,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalGrooveJoint >> anchor [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpGrooveJointGetAnchorB( self ))
]

{ #category : #Accessing }
CmExternalGrooveJoint >> grooveA [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpGrooveJointGetGrooveA( self ))
]

{ #category : #Accessing }
CmExternalGrooveJoint >> grooveB [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpGrooveJointGetGrooveB( self ))
]
