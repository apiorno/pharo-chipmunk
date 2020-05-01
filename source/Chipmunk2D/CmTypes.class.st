Class {
	#name : #CmTypes,
	#superclass : #SharedPool,
	#classVars : [
		'cpArbiter',
		'cpArray',
		'cpBB',
		'cpBody',
		'cpBodyPositionFunc',
		'cpBodyType',
		'cpBodyVelocityFunc',
		'cpBool',
		'cpCollisionBeginFunc',
		'cpCollisionPostSolveFunc',
		'cpCollisionPreSolveFunc',
		'cpCollisionSeparateFunc',
		'cpCollisionType',
		'cpConstraint',
		'cpContactBufferHeader',
		'cpDataPointer',
		'cpFloat',
		'cpGroup',
		'cpHashSet',
		'cpHashValue',
		'cpLayers',
		'cpShape',
		'cpShapeClass',
		'cpSpace',
		'cpSpatialIndex',
		'cpTimestamp',
		'cpVect'
	],
	#category : #'Chipmunk2D-Core'
}

{ #category : #'class initialization' }
CmTypes class >> initialize [
	"self initialize"
	
	cpBool := #bool.
	cpFloat := #float.
	cpTimestamp := #uint.
	cpHashValue := #uint.
	cpLayers := #uint.
	cpGroup := #uint.
	cpCollisionType := #uint.
	cpBodyType := #uint.
		
	"Translating to pointer"
	cpDataPointer := #ulong.
	cpShapeClass := #ulong.
	cpArray := #ulong.
	cpSpatialIndex := #ulong.
	cpContactBufferHeader := #ulong.
	cpHashSet := #ulong.
	cpBodyVelocityFunc := #ulong.
	cpBodyPositionFunc := #ulong.
	cpArbiter := #ulong.
	cpConstraint := #ulong.
	
	"Translating to inner classes"
	cpVect := #CmVector.
	cpSpace := #CmSpace.
	cpBody := #CmBody.
	cpShape := #CmShape.
	cpBB := #CmBoundingBox.
	cpCollisionBeginFunc := #CmCollisionBegin.
	cpCollisionPreSolveFunc := #CmCollisionPreSolve.
	cpCollisionPostSolveFunc :=#CmCollisionPostSolve.
	cpCollisionSeparateFunc := #CmCollisionSeparate.
]
