Trait {
	#name : #TChipmunkLibrary,
	#category : #'Chipmunk2D-Core'
}

{ #category : #'library path' }
TChipmunkLibrary classSide >> ffiLibraryName [

	^ ChipmunkLibrary
]

{ #category : #'library path' }
TChipmunkLibrary >> ffiLibraryName [

	^ self class ffiLibraryName
]
