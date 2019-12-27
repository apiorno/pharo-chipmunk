Class {
	#name : #CmConstraintApplyCachedImpulseImpl,
	#superclass : #CmCallback,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #accessing }
CmConstraintApplyCachedImpulseImpl class >> callType [

	^ #cdecl
]

{ #category : #accessing }
CmConstraintApplyCachedImpulseImpl class >> fnSpec [

	^ #(void (CmConstraint *constraint, cpFloat dt_coef))
]
