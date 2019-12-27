Class {
	#name : #CmCallback,
	#superclass : #FFICallback,
	#pools : [
		'CmTypes'
	],
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #private }
CmCallback class >> ffiBindingOf: aTypeName [

	^ ChipmunkLibrary ffiBindingOf: aTypeName
]
