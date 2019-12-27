Class {
	#name : #CmExternalStructure,
	#superclass : #FFIExternalStructure,
	#pools : [
		'CmTypes'
	],
	#classInstVars : [
		'arrayClass'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #accessing }
CmExternalStructure class >> arrayClass [

	self flag: 'resolver'.
	^ arrayClass ifNil: [ arrayClass := FFIExternalArray ofType: self name asString ]
]
