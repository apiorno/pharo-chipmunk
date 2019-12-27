Class {
	#name : #CmCollisionSeparate,
	#superclass : #CmCollisionFunction,
	#category : #'Chipmunk2D-ExpCollision'
}

{ #category : #'instance creation' }
CmCollisionSeparate class >> on: aBlock [

	^ self signature: #(void #(cpArbiter * arbiter , cpSpace * space , void * data)) block: aBlock
]
