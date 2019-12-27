Class {
	#name : #CmConstraintCallback,
	#superclass : #CmCallback,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #accessing }
CmConstraintCallback class >> callType [

	^ #cdecl
]

{ #category : #accessing }
CmConstraintCallback class >> fnSpec [

	^ #(void (CmConstraint contraint,  void * data))
]
