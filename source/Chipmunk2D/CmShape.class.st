Class {
	#name : #CmShape,
	#superclass : #CmExternalObject,
	#category : #'Chipmunk2D-Core'
}

{ #category : #finalization }
CmShape class >> finalizeResourceData: handle [

	self primCpShapeFree: handle
]

{ #category : #'Instance Creation' }
CmShape class >> newBoxBody: aBody boundingBox: aRectangle [

	"Creates a box shape with bounding box"

	self flag: 'should this call #initialize?'.
	self flag: 'falta el radius'.
	^ self primCpBoxNew: aBody boundingBox: aRectangle asCmBoundingBox
]

{ #category : #'Instance Creation' }
CmShape class >> newBoxBody: aBody extent: aPoint [

	"Creates a box shape with extent"

	self flag: 'should this call #initialize?'.
	self flag: 'falta el radius'.
	^ self primCpBoxNew: aBody width: aPoint x asFloat height: aPoint y asFloat
]

{ #category : #'Instance Creation' }
CmShape class >> newCircleBody: aBody radius: radius offset: offsetPoint [

	"Creates a circle shape (with a radius)"

	^ ( self primCpCircleShapeNew: aBody radius: radius asFloat offset: offsetPoint asCmVector )
		initialize
]

{ #category : #'Instance Creation' }
CmShape class >> newPolygonBody: aBody vertices: hullVertices offset: offsetPoint [

	"Creates a polygon shape from an array of vertices defining its clockwise convex hull and the offset from the center of gravity."

	| vertices |

	vertices := FFIExternalArray externalNewType: CmVector size: hullVertices size.
	hullVertices
		withIndexDo: [ :each :index | 
			| v |

			v := each asCmVector.
			( vertices at: index )
				x: v x;
				y: v y	"vertices at: index put: v"
			].

	^ ( self
		primCpPolygonNew: aBody
		verticesNumber: vertices size
		vertices: vertices getHandle
		offset: offsetPoint asCmVector ) initialize
]

{ #category : #'Instance Creation' }
CmShape class >> newSegmentBody: aBody from: fromPoint to: toPoint radius: aFloat [

	"Creates a segment shape from a point to another"

	^ ( self
		primCpSegmentNew: aBody
		from: fromPoint asCmVector
		to: toPoint asCmVector
		radius: aFloat asFloat ) initialize
]

{ #category : #private }
CmShape class >> primCpBoxNew: body boundingBox: box [

	^ self ffiCall: #(cpShape * cpBoxShapeNew2 #(cpBody * body , cpBB box))
]

{ #category : #private }
CmShape class >> primCpBoxNew: body width: width height: height [

	^ self ffiCall: #(cpShape * cpBoxShapeNew #(cpBody * body , cpFloat width , cpFloat height))
]

{ #category : #private }
CmShape class >> primCpCircleShapeNew: body radius: radius offset: offset [

	^ self ffiCall: #(cpShape * cpCircleShapeNew #(cpBody * body , cpFloat radius , cpVect offset))
]

{ #category : #private }
CmShape class >> primCpConvexHullCount: count source: verts result: result first: first tolerance: tol [

	^ self
		ffiCall:
			#(int cpConvexHull #(int count , cpVect * verts , cpVect * result , int * first , cpFloat tol))
]

{ #category : #private }
CmShape class >> primCpPolygonNew: body verticesNumber: numVertices vertices: vertices offset: offset [

	^ self
		ffiCall:
			#(cpShape * cpPolyShapeNew #(cpBody * body , int numVertices , void * vertices , cpVect offset))
]

{ #category : #private }
CmShape class >> primCpSegmentNew: body from: a to: b radius: radius [

	^ self
		ffiCall: #(cpShape * cpSegmentShapeNew #(cpBody * body , cpVect a , cpVect b , cpFloat radius))
]

{ #category : #private }
CmShape class >> primCpShapeFree: handle [

	self ffiCall: #(void cpShapeFree #(cpShape * handle))
]

{ #category : #Accessing }
CmShape >> collisionType [

	^ self ffiCall: #(cpCollisionType cpShapeGetCollisionType #(self))
]

{ #category : #Accessing }
CmShape >> collisionType: anInteger [

	^ self ffiCall: #(void cpShapeSetCollisionType #(self , cpCollisionType anInteger))
]

{ #category : #Accessing }
CmShape >> elasticity [

	^ self ffiCall: #(cpFloat cpShapeGetElasticity #(self))
]

{ #category : #Accessing }
CmShape >> elasticity: aFloat [

	^ self ffiCall: #(void cpShapeSetElasticity #(self , cpFloat aFloat))
]

{ #category : #Accessing }
CmShape >> friction [

	^ self ffiCall: #(cpFloat cpShapeGetFriction #(self))
]

{ #category : #Accessing }
CmShape >> friction: aFloat [

	^ self ffiCall: #(void cpShapeSetFriction #(self , cpFloat aFloat))
]
