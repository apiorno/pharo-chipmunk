Class {
	#name : #CmCollisionPreSolve,
	#superclass : #CmCollisionFunction,
	#category : #'Chipmunk2D-ExpCollision'
}

{ #category : #'instance creation' }
CmCollisionPreSolve class >> on: booleanBlock [

	^ self
		signature: #(cpBool #(cpArbiter * arbiter , cpSpace * space , void * data))
		block: booleanBlock
]
