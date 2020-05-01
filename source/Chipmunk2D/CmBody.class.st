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
CmBody class >> infinite [

	"Used for static bodies"

	^ self ofMass: Float infinity andMoment: Float infinity
]

{ #category : #'Instance Creation' }
CmBody class >> kinematic [

	"body of kinematic type with 0 mass and 0 moment"

	^ self primCpBodyNewKinematic
]

{ #category : #'Instance Creation' }
CmBody class >> ofMass: aMass andMoment: aMoment [

	^ ( self primCpBodyNewMass: aMass asFloat moment: aMoment asFloat ) initialize
]

{ #category : #private }
CmBody class >> primCpBodyFree: handle [

	self ffiCall: #(void cpBodyFree #(cpBody * handle))
]

{ #category : #private }
CmBody class >> primCpBodyNewKinematic [

	^ self ffiCall: #(cpBody * cpBodyNewKinematic #())
]

{ #category : #private }
CmBody class >> primCpBodyNewMass: m moment: i [

	^ self ffiCall: #(cpBody * cpBodyNew #(cpFloat m , cpFloat i))
]

{ #category : #private }
CmBody class >> primCpBodyNewStatic [

	^ self ffiCall: #(cpBody * cpBodyNewStatic #())
]

{ #category : #'Instance Creation' }
CmBody class >> static [

	"body of static type with 0 mass and 0 moment"

	^ self primCpBodyNewStatic
]

{ #category : #'Managing shapes' }
CmBody >> addShape: aShape [

	self primAddShape: aShape
]

{ #category : #Accessing }
CmBody >> angle [

	^ self primAngle
]

{ #category : #Accessing }
CmBody >> angle: aNumber [

	^ self primAngle: aNumber asFloat
]

{ #category : #Accessing }
CmBody >> angularVelocity [

	^ self primAngularVelocity
]

{ #category : #Accessing }
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

{ #category : #Accessing }
CmBody >> centerOfGravity [

	^ self primCenterOfGravity asPoint
]

{ #category : #Accessing }
CmBody >> centerOfGravity: aVector [

	self primCenterOfGravity: aVector asCmVector 
]

{ #category : #Accessing }
CmBody >> force [

	^ self primForce asPoint
]

{ #category : #Accessing }
CmBody >> force: aPoint [

	self primForce: aPoint asCmVector
]

{ #category : #Testing }
CmBody >> isSleeping [

	^ self indirectCall: #(cpBool cpBodyIsSleeping #(self))
]

{ #category : #Accessing }
CmBody >> mass [

	^ self primMass
]

{ #category : #Accessing }
CmBody >> mass: aNumber [

	^ self primMass: aNumber asFloat
]

{ #category : #Accessing }
CmBody >> moment [

	^ self primMoment
]

{ #category : #Accessing }
CmBody >> moment: aNumber [

	^ self primMoment: aNumber asFloat
]

{ #category : #Accessing }
CmBody >> position [

	^ self primPosition asPoint
]

{ #category : #Accessing }
CmBody >> position: aPoint [

	self primPosition: aPoint asCmVector
]

{ #category : #private }
CmBody >> primAddShape: aShape [

	self ffiCall: #(void cpBodyAddShape #(self, cpShape * aShape))
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

	^ self ffiCall: #(cpFloat cpBodyGetMoment #(self))
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
CmBody >> primRemoveShape: aShape [

	self ffiCall: #(void cpBodyRemoveShape #(self, cpShape * aShape))
]

{ #category : #private }
CmBody >> primRotation [

	^ self ffiCall: #(cpVect cpBodyGetRotation #(self))
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
CmBody >> primType: aType [

	self ffiCall: #(void cpBodySetType #(self, cpBodyType aType))
]

{ #category : #private }
CmBody >> primVelocity [

	^ self ffiCall: #(cpVect cpBodyGetVelocity #(self))
]

{ #category : #private }
CmBody >> primVelocity: vector [

	^ self ffiCall: #(void cpBodySetVelocity #(self , cpVect vector))
]

{ #category : #'Managing shapes' }
CmBody >> removeShape: aShape [

	self primRemoveShape: aShape
]

{ #category : #Accessing }
CmBody >> rotation [

	^ self primRotation
]

{ #category : #Accessing }
CmBody >> space [

	^ self primSpace 
]

{ #category : #Accessing }
CmBody >> torque [

	^ self primTorque
]

{ #category : #Accessing }
CmBody >> torque: aFloat [

	^ self primTorque: aFloat
]

{ #category : #Accessing }
CmBody >> type [

	^ self primType
]

{ #category : #Accessing }
CmBody >> type: aType [

	^ self primType: aType
]

{ #category : #Accessing }
CmBody >> velocity [

	^ self primVelocity asPoint
]

{ #category : #Accessing }
CmBody >> velocity: aPoint [

	self primVelocity: aPoint asCmVector
]
