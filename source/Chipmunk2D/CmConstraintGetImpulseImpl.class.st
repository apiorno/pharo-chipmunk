Class {
	#name : #CmConstraintGetImpulseImpl,
	#superclass : #CmCallback,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #accessing }
CmConstraintGetImpulseImpl class >> callType [

	^ #cdecl
]

{ #category : #accessing }
CmConstraintGetImpulseImpl class >> fnSpec [

	^ #(void (CmConstraint *constraint, cpFloat dt))
]
