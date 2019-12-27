Class {
	#name : #CmCollisionBegin,
	#superclass : #CmCollisionFunction,
	#category : #'Chipmunk2D-ExpCollision'
}

{ #category : #'instance creation' }
CmCollisionBegin class >> on: booleanBlock [

	^ self
		signature: #(cpBool #(cpArbiter * arbiter , cpSpace * space , void * data))
		block: booleanBlock
]
