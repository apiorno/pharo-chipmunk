Class {
	#name : #CmConstraintPreStepImpl,
	#superclass : #CmCallback,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #accessing }
CmConstraintPreStepImpl class >> callType [

	^ #cdecl
]

{ #category : #accessing }
CmConstraintPreStepImpl class >> fnSpec [

	^ #(cpFloat (CmConstraint * constraint))
]
