Class {
	#name : #CmSpace,
	#superclass : #CmExternalObject,
	#category : #'Chipmunk2D-Core'
}

{ #category : #finalization }
CmSpace class >> finalizeResourceData: handle [

	self primCpSpaceFree: handle
]

{ #category : #'Instance Creation' }
CmSpace class >> new [

	^ self primCpSpaceNew initialize
]

{ #category : #private }
CmSpace class >> primCpSpaceFree: handle [

	self ffiCall: #(void cpSpaceFree #(cpSpace * handle))
]

{ #category : #private }
CmSpace class >> primCpSpaceNew [

	^ self ffiCall: #(cpSpace * cpSpaceNew #())
]

{ #category : #Managing }
CmSpace >> addBody: body [

	^ self ffiCall: #(void cpSpaceAddBody #(self , cpBody * body))
]

{ #category : #Collision }
CmSpace >> addCollisionHandlerBetween: typeA and: typeB [

	^ self
		ffiCall: #(void cpSpaceAddCollisionHandler #(self , cpCollisionType typeA , cpCollisionType typeB))
]

{ #category : #Constraints }
CmSpace >> addConstraint: aConstraint [

	self flag: #todo.
	^ self ffiCall: #(cpConstraint cpSpaceAddConstraint #(self , cpConstraint * aConstraint))
]

{ #category : #Managing }
CmSpace >> addShape: shape [

	^ self ffiCall: #(cpShape * cpSpaceAddShape #(self , cpShape * shape))
]

{ #category : #Accessing }
CmSpace >> collisionSlop: aFloat [

	^ self primCollisionSlop: aFloat
]

{ #category : #Accessing }
CmSpace >> damping [

	^ self primDamping
]

{ #category : #Accessing }
CmSpace >> damping: aFloat [

	self primDamping: aFloat asFloat
]

{ #category : #Accessing }
CmSpace >> gravity [

	^ self primGravity asPoint
]

{ #category : #Accessing }
CmSpace >> gravity: aVector [

	self primGravity: aVector asCmVector
]

{ #category : #Accessing }
CmSpace >> iterations: anInteger [

	^ self primIteration: anInteger
]

{ #category : #Accessing }
CmSpace >> nearestShapeFrom: aPoint maxDistance: maxDistance [

	^ self
		primNearestShapeFrom: aPoint asCmVector
		maxDistance: maxDistance asFloat
		layers: nil
		group: nil
		info: nil
]

{ #category : #private }
CmSpace >> primCollisionSlop: aFloat [

	^ self ffiCall: #(void cpSpaceSetCollisionSlop #(self , cpFloat aFloat))
]

{ #category : #private }
CmSpace >> primDamping [

	^ self ffiCall: #(cpFloat cpSpaceGetDamping #(self))
]

{ #category : #private }
CmSpace >> primDamping: aFloat [

	^ self ffiCall: #(void cpSpaceSetDamping #(self , cpFloat aFloat))
]

{ #category : #private }
CmSpace >> primGravity [

	^ self ffiCall: #(cpFloat cpSpaceGetGravity #(self))
]

{ #category : #private }
CmSpace >> primGravity: aVector [

	^ self ffiCall: #(void cpSpaceSetGravity #(self , cpVect aVector))
]

{ #category : #private }
CmSpace >> primIteration: anInteger [

	^ self ffiCall: #(void cpSpaceSetIterations #(self , int anInteger))
]

{ #category : #private }
CmSpace >> primNearestShapeFrom: aVector maxDistance: aFloat layers: layersFilter group: aGroup info: aNearestPointInfo [

	^ self
		ffiCall:
			#(cpShape * cpSpacePointQueryNearest #(cpSpace self , cpVect aVector , cpFloat aFloat , cpShapeFilter layersFilter , cpGroup aGroup , cpPointQueryInfo * aNearestPointInfo))
]

{ #category : #private }
CmSpace >> primSleepTimeThereshold: aFloat [

	^ self ffiCall: #(void cpSpaceSetSleepTimeThreshold #(self , cpFloat aFloat))
]

{ #category : #private }
CmSpace >> primStep: time [

	^ self ffiCall: #(void cpSpaceStep #(self , cpFloat time))
]

{ #category : #Collision }
CmSpace >> removeCollisionHandlerBetween: typeA and: typeB [

	^ self
		ffiCall:
			#(void cpSpaceRemoveCollisionHandler #(cpSpace self , cpCollisionType typeA , cpCollisionType typeB))
]

{ #category : #Collision }
CmSpace >> setDefaultCollisionBegin: begin preSolve: preSolve postSolve: postSolve separate: separate data: data [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(void cpSpaceSetDefaultCollisionHandler #(self , cpCollisionBeginFunc begin , cpCollisionPreSolveFunc preSolve , cpCollisionPostSolveFunc postSolve , cpCollisionSeparateFunc separate , void * data))
]

{ #category : #Accessing }
CmSpace >> sleepTimeThereshold: aFloat [

	^ self primSleepTimeThereshold: aFloat
]

{ #category : #Accessing }
CmSpace >> staticBody [

	^ self ffiCall: #(cpBody * cpSpaceGetStaticBody #(self))
]

{ #category : #Stepping }
CmSpace >> step: aNumber [

	self primStep: aNumber asFloat
]
