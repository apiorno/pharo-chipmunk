Class {
	#name : #CmExternalDampedSpring,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalDampedSpring >> anchr1 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpDampedSpringGetAnchorA( self ))
]

{ #category : #Accessing }
CmExternalDampedSpring >> anchr2 [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpVect cpDampedSpringGetAnchorB( self ))
]

{ #category : #Accessing }
CmExternalDampedSpring >> damping [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpDampedSpringGetDamping( self ))
]

{ #category : #Accessing }
CmExternalDampedSpring >> restLength [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpDampedSpringGetRestLength( self ))
]

{ #category : #Accessing }
CmExternalDampedSpring >> stiffness [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpDampedSpringGetStiffness( self ))
]
