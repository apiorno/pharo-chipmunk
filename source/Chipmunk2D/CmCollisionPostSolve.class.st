Class {
	#name : #CmCollisionPostSolve,
	#superclass : #CmCollisionFunction,
	#category : #'Chipmunk2D-ExpCollision'
}

{ #category : #'instance creation' }
CmCollisionPostSolve class >> on: aBlock [

	^ self signature: #(void #(cpArbiter * arbiter , cpSpace * space , void * data)) block: aBlock
]
