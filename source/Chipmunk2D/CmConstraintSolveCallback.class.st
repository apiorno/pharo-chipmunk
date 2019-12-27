Class {
	#name : #CmConstraintSolveCallback,
	#superclass : #CmCallback,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #accessing }
CmConstraintSolveCallback class >> callType [

	^ #cdecl
]

{ #category : #accessing }
CmConstraintSolveCallback class >> fnSpec [

	^ #(void (CmConstraint *constraint, CmSpace *space))
]
