Class {
	#name : #CmExternalConstraint,
	#superclass : #CmExternalObject,
	#category : #'Chipmunk2D-ExpJoint'
}

{ #category : #finalization }
CmExternalConstraint class >> finalizeResourceData: handle [

	^ handle ifNotNil: [ self primReleaseContraint: handle ]
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> new [

	^ self basicNew initialize
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newDampedRotarySpring: aBody with: anotherbody restAngle: restAngle stiffness: stiffness damping: damping [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(CmExternalConstraint cpDampedRotarySpringNew #(CmBody aBody , CmBody anotherbody , cpFloat restAngle , cpFloat stiffness , cpFloat damping))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newDampedSpring: aBody with: anotherbody anchor1: anchr1 anchor2: anchr2 restLength: aFloat stiffness: stiffness damping: damping [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(CmExternalConstraint cpDampedSpringNew #(CmBody aBody , CmBody anotherbody , CmVector anchr1 , CmVector anchr2 , cpFloat restLength , cpFloat stiffness , cpFloat damping))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newFor: aExternalConstraint [

	| inst |

	inst := self basicNew initialize.
	inst handle: aExternalConstraint handle.
	^ inst
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newGearJoint: aBody with: anotherbody phase: phase ratio: ratio [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(CmExternalConstraint cpGearJointNew #(CmBody aBody , CmBody anotherbody , cpFloat phase , cpFloat ratio))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newGrooveJoint: aBody with: anotherbody anchor: anchr1 grooveA: aVector grooveB: anotherVector [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(CmExternalConstraint cpGrooveJointNew #(CmBody aBody , CmBody anotherbody , CmVector aVector , CmVector anotherVector , CmVector anchr1))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newPinJoint: aBody with: anotherbody anchor: anchr1 andAnchor2: anchr2 [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(CmExternalConstraint cpPinJointNew #(CmBody aBody , CmBody anotherbody , CmVector anchr1 , CmVector anchr2))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newPivotJoint: aBody with: anotherbody joinedTo: aVect [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall: #(CmExternalConstraint cpPivotJointNew #(CmBody aBody , CmBody anotherbody , CmVector aVect))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newRatchetJoint: aBody with: anotherbody phase: phase ratchet: ratchet [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(CmExternalConstraint cpRatchetJointNew #(CmBody aBody , CmBody anotherbody , cpFloat phase , cpFloat ratchet))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newRotaryLimitJoint: aBody with: anotherbody min: min max: max [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(CmExternalConstraint cpRotaryLimitJointNew #(CmBody aBody , CmBody anotherbody , cpFloat min , cpFloat max))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newSimpleMotor: aBody with: anotherbody rate: rate [

	"cpSimpleMotorNew(cpBody *a, cpBody *b, cpFloat rate) "

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall: #(CmExternalConstraint cpSimpleMotorNew #(CmBody aBody , CmBody anotherbody , cpFloat rate))
]

{ #category : #'Instance Creation' }
CmExternalConstraint class >> newSlideJoint: aBody with: anotherbody anchor1: anchr1 anchor2: anchr2 min: min max: max [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self
		nbCall:
			#(CmExternalConstraint cpSlideJointNew #(CmBody aBody , CmBody anotherbody , CmVector anchr1 , CmVector anchr2 , cpFloat min , cpFloat max))
]

{ #category : #finalization }
CmExternalConstraint class >> primReleaseContraint: handle [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	self nbCall: #(void cpConstraintFree #(ulong handle))
]

{ #category : #'accessing structure variables' }
CmExternalConstraint >> a [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpBody* cpConstraintGetBodyA( self ))
]

{ #category : #'accessing structure variables' }
CmExternalConstraint >> b [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>

	^ self ffiCall:  #( cpBody* cpConstraintGetBodyB( self ))
]

{ #category : #'accessing structure variables' }
CmExternalConstraint >> constraint [
self flag: 'Ver esto'.
	"^CmConstraint fromPointer: (NBExternalAddress value: self handle). "
]

{ #category : #initialization }
CmExternalConstraint >> initialize [
	super initialize.
	self flag: 'Ver esto'.
	"handle := NBExternalHandle new"
]

{ #category : #testing }
CmExternalConstraint >> isDampedRotarySpring: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsDampedRotarySpring #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isDampedSpring: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsDampedSpring #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isGearJoint: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsGearJoint #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isGrooveJoint: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsGrooveJoint #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isPinJoint: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsPinJoint #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isPivotJoint: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsPivotJoint #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isRatchetJoint: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsRatchetJoint #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isRotaryLimitJoint: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsRotaryLimitJoint #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isSimpleMotor: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsSimpleMotor #(* aConstraint))
]

{ #category : #testing }
CmExternalConstraint >> isSlideJoint: aConstraint [

	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #(cpBool cpConstraintIsSlideJoint #(* aConstraint))
]

{ #category : #evaluating }
CmExternalConstraint >> specialize [
	| constraintMaterialize |
	constraintMaterialize := self constraint.
self flag: 'Ver esto'.	
	" this seems ugly or easily replacable by a double dispatch but the C library of Chipmunk using cast for create specialized pointer to constraint. 
	So in some context we can determine the type (ex newSimpleMotor will return a simpleMotor) but not in all the case, so we need to cast in some case ). "
	
	( self isDampedRotarySpring: constraintMaterialize ) ifTrue:[^CmExternalDampedRotarySpring newFor: self ].
	(self isDampedSpring: constraintMaterialize ) ifTrue:[^CmExternalDampedSpring newFor: self ].
	(self isGearJoint: constraintMaterialize) ifTrue:[^CmExternalGearJoint newFor: self ].
	(self isGrooveJoint: constraintMaterialize) ifTrue:[^CmExternalGrooveJoint newFor: self ].
	(self isPinJoint: constraintMaterialize) ifTrue:[^CmExternalPinJoint newFor: self ].
	(self isPinJoint: constraintMaterialize) ifTrue:[^CmExternalPivotJoint newFor: self ].
	(self isRatchetJoint: constraintMaterialize) ifTrue:[^CmExternalRatchetJoint newFor: self ].
	(self isRotaryLimitJoint: constraintMaterialize) ifTrue:[^CmExternalRotaryLimitJoint newFor: self ].
	(self isSimpleMotor: constraintMaterialize) ifTrue:[^CmExternalSimpleMotor newFor: self ].
	(self isSlideJoint: constraintMaterialize) ifTrue:[^CmExternalSlideJoint newFor: self ].
	
]
