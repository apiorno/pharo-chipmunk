Class {
	#name : #CmConstraintClass,
	#superclass : #CmExternalStructure,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #'field definition' }
CmConstraintClass class >> fieldsDesc [
	"self rebuildFieldAccessors "
	^#(
		CmConstraintPreStepImpl preStep;
		CmConstraintApplyCachedImpulseImpl applyCachedImpulse;
		CmConstraintApplyImpulseImpl applyImpulse;
		CmConstraintGetImpulseImpl getImpulse;
	)
]
