Class {
	#name : #CmExternalDampedRotarySpring,
	#superclass : #CmExternalConstraint,
	#type : #variable,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #Accessing }
CmExternalDampedRotarySpring >> damping [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat _cpDampedRotarySpringGetDamping( self ))
]

{ #category : #Accessing }
CmExternalDampedRotarySpring >> restAngle [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpDampedRotarySpringGetRestAngle( self ))
]

{ #category : #Accessing }
CmExternalDampedRotarySpring >> stiffness [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpFloat cpDampedRotarySpringGetStiffness( self ))
]
