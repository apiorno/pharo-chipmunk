Class {
	#name : #CmConstraintApplyImpulseImpl,
	#superclass : #CmCallback,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #accessing }
CmConstraintApplyImpulseImpl class >> callType [

	^ #cdecl
]

{ #category : #accessing }
CmConstraintApplyImpulseImpl class >> fnSpec [

	^ #(void (CmConstraint *constraint, cpFloat dt))
]
