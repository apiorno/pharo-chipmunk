Class {
	#name : #ChipmunkLibrary,
	#superclass : #FFILibrary,
	#classVars : [
		'TypeMap'
	],
	#pools : [
		'CmTypes'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #private }
ChipmunkLibrary class >> enableSegmentToSegmentCollisions [

	self ffiCall: #(void cpEnableSegmentToSegmentCollisions #(void))
]

{ #category : #'Type mappings' }
ChipmunkLibrary class >> ffiBindingOf: aTypeName [

	^ TypeMap at: aTypeName ifAbsent: [ super ffiBindingOf: aTypeName ]
]

{ #category : #'Library path' }
ChipmunkLibrary class >> ffiLibraryName [

	^ self uniqueInstance ffiLibraryName
]

{ #category : #initialization }
ChipmunkLibrary class >> initialize [

	self initializeTypeMap
]

{ #category : #initialization }
ChipmunkLibrary class >> initializeTypeMap [
	"self initializeTypeMap"
	TypeMap := Dictionary newFromPairs: #(
		cpBool                    bool
		cpFloat                   float
		cpTimestamp               uint
		cpHashValue               uint
		cpLayers                  uint
		cpGroup                   uint
		cpCollisionType           uint

		cpDataPointer             ulong
		cpShapeClass              ulong
		cpArray                   ulong
		cpSpatialIndex            ulong
		cpContactBufferHeader     ulong
		cpHashSet                 ulong
		cpBodyVelocityFunc        ulong
		cpBodyPositionFunc        ulong
		cpArbiter                 ulong
		cpConstraint              ulong
		
		cpCollisionBeginFunc      CmCollisionBegin
		cpCollisionPreSolveFunc   CmCollisionPreSolve
		cpCollisionPostSolveFunc  CmCollisionPostSolve
		cpCollisionSeparateFunc   CmCollisionSeparate

		cpVect                    CmVector
		cpSpace                   CmSpace
		cpBody                    CmBody
		cpShape                   CmShape
		cpBB                      CmBoundingBox
	)
]

{ #category : #moments }
ChipmunkLibrary class >> momentForBoxWithMass: mass boundingBox: bb [

	^ self primCpMomentForBox2WithMass: mass asFloat boundingBox: bb asCmBoundingBox
]

{ #category : #moments }
ChipmunkLibrary class >> momentForBoxWithMass: mass width: width height: height [

	^ self primCpMomentForBoxWithMass: mass asFloat width: width asFloat height: height asFloat
]

{ #category : #moments }
ChipmunkLibrary class >> momentForCircleWithMass: mass innerRadius: r1 outerRadius: r2 offset: offset [

	^ self
		primCpMomentForCircleWithMass: mass asFloat
		innerRadius: r1 asFloat
		outerRadius: r2 asFloat
		offset: offset asCmVector
]

{ #category : #moments }
ChipmunkLibrary class >> momentForSegmentWithMass: mass from: from to: to [

	^ self primCpMomentForSegmentWithMass: mass asFloat from: from asCmVector to: to asCmVector
]

{ #category : #private }
ChipmunkLibrary class >> primCpMomentForBox2WithMass: m boundingBox: box [

	^ self ffiCall: #(cpFloat cpMomentForBox2 #(cpFloat m , cpBB box))
]

{ #category : #private }
ChipmunkLibrary class >> primCpMomentForBoxWithMass: m width: width height: height [

	^ self ffiCall: #(cpFloat cpMomentForBox #(cpFloat m , cpFloat width , cpFloat height))
]

{ #category : #private }
ChipmunkLibrary class >> primCpMomentForCircleWithMass: m innerRadius: r1 outerRadius: r2 offset: offset [

	^ self ffiCall: #(cpFloat cpMomentForCircle #(cpFloat m , cpFloat r1 , cpFloat r2 , cpVect offset))
]

{ #category : #private }
ChipmunkLibrary class >> primCpMomentForPolyWithMass: m numVertices: numVerts vertices: vertices offset: offset [

	^ self
		ffiCall: #(cpFloat cpMomentForPoly #(cpFloat m , int numVerts , cpVect * vertices , cpVect offset))
]

{ #category : #private }
ChipmunkLibrary class >> primCpMomentForSegmentWithMass: m from: a to: b [

	^ self ffiCall: #(cpFloat cpMomentForSegment #(cpFloat m , cpVect a , cpVect b))
]

{ #category : #'accessing platform' }
ChipmunkLibrary >> macModuleName [

	^ (FileLocator imageDirectory / 'libchipmunk.dylib') fullName
]

{ #category : #'accessing platform' }
ChipmunkLibrary >> unixModuleName [

	^ (FileLocator imageDirectory / 'libchipmunk.so') fullName
]

{ #category : #'accessing platform' }
ChipmunkLibrary >> win32ModuleName [

	^ (FileLocator imageDirectory / 'libchipmunk.dll') fullName
]
