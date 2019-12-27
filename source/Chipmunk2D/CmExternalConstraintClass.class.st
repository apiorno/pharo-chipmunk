Class {
	#name : #CmExternalConstraintClass,
	#superclass : #CmExternalObject,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #comparing }
CmExternalConstraintClass >> = anotherPointer [

	^ self handle = anotherPointer handle
]

{ #category : #Accessing }
CmExternalConstraintClass >> constraintClass [
self flag: 'Ver esto'.
	"^CmConstraintClass fromPointer:  (NBExternalAddress value: self handle). "
]
