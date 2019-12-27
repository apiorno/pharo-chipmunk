Class {
	#name : #CmBody,
	#superclass : #CmExternalObject,
	#category : #'Chipmunk2D-Core'
}

{ #category : #finalization }
CmBody class >> finalizeResourceData: handle [

	self primCpBodyFree: handle
]

{ #category : #'Instance Creation' }
CmBody class >> newInfinite [

	"Used for static bodies"

	^ self newMass: Float infinity moment: Float infinity
]

{ #category : #'Instance Creation' }
CmBody class >> newMass: mass moment: moment [

	^ ( self primCpBodyNewMass: mass asFloat moment: moment asFloat ) initialize
]

{ #category : #private }
CmBody class >> primCpBodyFree: handle [

	self ffiCall: #(void cpBodyFree #(cpBody * handle))
]

{ #category : #private }
CmBody class >> primCpBodyNewMass: m moment: i [

	^ self ffiCall: #(cpBody * cpBodyNew #(cpFloat m , cpFloat i))
]

{ #category : #accessing }
CmBody >> angle [

	^ self primAngle
]

{ #category : #accessing }
CmBody >> angle: aNumber [

	^ self primAngle: aNumber asFloat
]

{ #category : #accessing }
CmBody >> angularVelocity [

	^ self primAngularVelocity
]

{ #category : #accessing }
CmBody >> angularVelocity: aNumber [

	self primAngularVelocity: aNumber asFloat
]

{ #category : #impulse }
CmBody >> applyLocalImpulse: impulsePoint atOffset: offsetPoint [

	self primApplyLocalImpulse: impulsePoint asCmVector atOffset: offsetPoint asCmVector
]

{ #category : #impulse }
CmBody >> applyWorldImpulse: impulsePoint atOffset: offsetPoint [

	self primApplyWorldImpulse: impulsePoint asCmVector atOffset: offsetPoint asCmVector
]

{ #category : #accessing }
CmBody >> centerOfGravity [

	^ self primCenterOfGravity asPoint
]

{ #category : #accessing }
CmBody >> centerOfGravity: aVector [

	self primCenterOfGravity: aVector
]

{ #category : #accessing }
CmBody >> force [

	^ self primForce asPoint
]

{ #category : #accessing }
CmBody >> force: aPoint [

	self primForce: aPoint asCmVector
]

{ #category : #Testing }
CmBody >> isSleeping [

	^ self indirectCall: #(cpBool cpBodyIsSleeping #(self))
]

{ #category : #accessing }
CmBody >> mass [

	^ self primMass
]

{ #category : #accessing }
CmBody >> mass: aNumber [

	^ self primMass: aNumber asFloat
]

{ #category : #accessing }
CmBody >> moment [

	^ self primMoment
]

{ #category : #accessing }
CmBody >> moment: aNumber [

	^ self primMoment: aNumber asFloat
]

{ #category : #accessing }
CmBody >> position [

	^ self primPosition asPoint
]

{ #category : #accessing }
CmBody >> position: aPoint [

	self primPosition: aPoint asCmVector
]

{ #category : #private }
CmBody >> primAngle [

	^ self ffiCall: #(cpFloat cpBodyGetAngle #(self))
]

{ #category : #private }
CmBody >> primAngle: aFloat [

	^ self ffiCall: #(void cpBodySetAngle #(self , cpFloat aFloat))
]

{ #category : #private }
CmBody >> primAngularVelocity [

	^ self ffiCall: #(cpFloat cpBodyGetAngularVelocity #(self))
]

{ #category : #private }
CmBody >> primAngularVelocity: velocity [

	^ self ffiCall: #(void cpBodySetAngularVelocity #(self , cpFloat velocity))
]

{ #category : #private }
CmBody >> primApplyLocalImpulse: impulseVector atOffset: offsetVector [

	^ self
		ffiCall: #(void cpBodyApplyImpulseAtLocalPoint #(self , cpVect impulseVector , cpVect offsetVector))
]

{ #category : #private }
CmBody >> primApplyWorldImpulse: impulseVector atOffset: offsetVector [

	^ self
		ffiCall: #(void cpBodyApplyImpulseAtWorldPoint #(self , cpVect impulseVector , cpVect offsetVector))
]

{ #category : #private }
CmBody >> primCenterOfGravity [

	^ self ffiCall: #(cpVect cpBodyGetCenterOfGravity #(self))
]

{ #category : #private }
CmBody >> primCenterOfGravity: aVector [

	^ self ffiCall: #(void cpBodySetCenterOfGravity #(self , cpVect aVector))
]

{ #category : #private }
CmBody >> primForce [

	^ self ffiCall: #(cpVect cpBodyGetForce #(self))
]

{ #category : #private }
CmBody >> primForce: aVector [

	^ self ffiCall: #(void cpBodySetForce #(self , cpVect aVector))
]

{ #category : #private }
CmBody >> primMass [

	^ self ffiCall: #(cpFloat cpBodyGetMass #(self))
]

{ #category : #private }
CmBody >> primMass: aFloat [

	^ self ffiCall: #(void cpBodySetMass #(self , cpFloat aFloat))
]

{ #category : #private }
CmBody >> primMoment [

	^ self ffiCall: #(void cpBodyGetMoment #(self))
]

{ #category : #private }
CmBody >> primMoment: aFloat [

	^ self ffiCall: #(void cpBodySetMoment #(self , cpFloat aFloat))
]

{ #category : #private }
CmBody >> primPosition [

	^ self ffiCall: #(cpVect cpBodyGetPosition #(self))
]

{ #category : #private }
CmBody >> primPosition: vector [

	^ self ffiCall: #(void cpBodySetPosition #(self , cpVect vector))
]

{ #category : #private }
CmBody >> primRotation [

	^ self ffiCall: #(cpVect cpBodyGetRotation #(self))
]

{ #category : #private }
CmBody >> primRotation: aVector [

	^ self ffiCall: #(void cpBodySetRotation #(self , cpVect aVector))
]

{ #category : #private }
CmBody >> primSpace [

	^ self ffiCall: #(cpSpace * cpBodyGetSpace #(self))
]

{ #category : #private }
CmBody >> primTorque [

	^ self ffiCall: #(cpFloat cpBodyGetTorque #(self))
]

{ #category : #private }
CmBody >> primTorque: aFloat [

	^ self ffiCall: #(void cpBodySetTorque #(self , cpFloat aFloat))
]

{ #category : #private }
CmBody >> primType [

	^ self ffiCall: #(cpBodyType cpBodyGetType #(self))
]

{ #category : #private }
CmBody >> primVelocity [

	^ self ffiCall: #(cpVect cpBodyGetVelocity #(self))
]

{ #category : #private }
CmBody >> primVelocity: vector [

	^ self ffiCall: #(void cpBodySetVelocity #(self , cpVect vector))
]

{ #category : #accessing }
CmBody >> rotation [

	^ self primRotation
]

{ #category : #accessing }
CmBody >> rotation: aPoint [

	self primRotation: aPoint asCmVector
]

{ #category : #accessing }
CmBody >> torque [

	^ self primTorque
]

{ #category : #accessing }
CmBody >> torque: aFloat [

	^ self primTorque: aFloat
]

{ #category : #accessing }
CmBody >> type [

	^ self primType
]

{ #category : #accessing }
CmBody >> velocity [

	^ self primVelocity asPoint
]

{ #category : #accessing }
CmBody >> velocity: aPoint [

	self primVelocity: aPoint asCmVector
]
