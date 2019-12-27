Class {
	#name : #CmExternalObject,
	#superclass : #FFIOpaqueObject,
	#traits : 'TChipmunkLibrary',
	#classTraits : 'TChipmunkLibrary classTrait',
	#pools : [
		'CmTypes'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #finalization }
CmExternalObject class >> finalizeResourceData: handle [

	self subclassResponsibility
]

{ #category : #finalization }
CmExternalObject class >> new [

	self error: 'Invalid invocation'
]

{ #category : #private }
CmExternalObject >> indirectCall: fnSpec [

	^ ( self ffiCalloutIn: thisContext sender )
		convention: self ffiCallingConvention;
		options: #(optIndirectCall);
		function: fnSpec module: self ffiLibraryName
]

{ #category : #initialization }
CmExternalObject >> initialize [

	super initialize.
	self autoRelease
]
