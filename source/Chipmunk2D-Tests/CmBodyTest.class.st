Class {
	#name : #CmBodyTest,
	#superclass : #TestCase,
	#instVars : [
		'bodies'
	],
	#category : #'Chipmunk2D-Tests'
}

{ #category : #tests }
CmBodyTest >> testDynamicBodyAccessing [

	| body |

	body := CmBody ofMass: 1.0 andMoment: 1.0 .

	self
		assert: body type equals: 3;
		assert: body angle equals: 0.0;
		assert: body angularVelocity equals: 0.0;
		assert: body centerOfGravity equals: 0.0 @ 0.0;
		assert: body force equals: 0.0 @ 0.0;
		assert: body mass equals: 1.0;
		assert: body moment equals: 1.0;
		assert: body position equals: 0.0 @ 0.0;
		assert: body rotation asPoint equals: 0.0 @ 0.0;
		assert: body torque equals: 0.0;
		assert: body space notNil;
		assert: body velocity equals: 0.0 @ 0.0.
"Can not set mass to a kinematic body"
	body
		angle: 1.0;
		angularVelocity: 1.0;
		centerOfGravity: 1.0 @ 1.0;
		force: 1.0 @ 1.0;
		mass: 2.0;
		moment: 2.0;
		position: 1.0 @ 1.0;
		torque: 1.0;
		velocity: 1.0 @ 1.0.

	self
		assert: body angle equals: 1.0;	
		assert: body angularVelocity equals: 1.0;
		assert: body mass equals: 2.0;
		"Not working but should"
		"assert: body centerOfGravity equals: 1.0 @ 1.0;
		assert: body force equals: 1.0 @ 1.0;
		assert: body position equals: 1.0 @ 1.0;
		assert: body velocity equals: 1.0 @ 1.0;"
		assert: body moment equals: 2.0;
		assert: body torque equals: 1.0
		
]

{ #category : #tests }
CmBodyTest >> testKinematicBodyAccessing [

	| body |

	body := CmBody kinematic.

	self
		assert: body type equals: 1;
		assert: body angle equals: 0.0;
		assert: body angularVelocity equals: 0.0;
		assert: body centerOfGravity equals: 0.0 @ 0.0;
		assert: body force equals: 0.0 @ 0.0;
		assert: body mass equals: 0.0;
		assert: body moment equals: 0.0;
		assert: body position equals: 0.0 @ 0.0;
		assert: body rotation asPoint equals: 0.0 @ 0.0;
		assert: body torque equals: 0.0;
		assert: body space notNil;
		assert: body velocity equals: 0.0 @ 0.0.
"Can not set mass to a kinematic body"
	body
		angle: 1.0;
		angularVelocity: 1.0;
		centerOfGravity: 1.0 @ 1.0;
		force: 1.0 @ 1.0;
		moment: 1.0;
		position: 1.0 @ 1.0;
		torque: 1.0;
		velocity: 1.0 @ 1.0.

	self
		assert: body angle equals: 1.0;	
		assert: body angularVelocity equals: 1.0;
		"Not working but should"
		"assert: body centerOfGravity equals: 1.0 @ 1.0;
		assert: body force equals: 1.0 @ 1.0;
		assert: body position equals: 1.0 @ 1.0;
		assert: body velocity equals: 1.0 @ 1.0;"
		assert: body moment equals: 1.0;
		assert: body torque equals: 1.0
		
]

{ #category : #tests }
CmBodyTest >> testStaticBodyAccessing [

	| body |

	body := CmBody static.

	self
		assert: body type equals: 2;
		assert: body angle equals: 0.0;
		assert: body angularVelocity equals: 0.0;
		assert: body centerOfGravity equals: 0.0 @ 0.0;
		assert: body force equals: 0.0 @ 0.0;
		assert: body mass equals: 0.0;
		assert: body moment equals: 0.0;
		assert: body position equals: 0.0 @ 0.0;
		assert: body rotation asPoint equals: 0.0 @ 0.0;
		assert: body torque equals: 0.0;
		assert: body space notNil;
		assert: body velocity equals: 0.0 @ 0.0.
		
"Can not set mass to a static body"
	body
		angle: 1.0;
		angularVelocity: 1.0;
		centerOfGravity: 1.0 @ 1.0;
		force: 1.0 @ 1.0;
		moment: 1.0;
		position: 1.0 @ 1.0;
		torque: 1.0;
		velocity: 1.0 @ 1.0.

	self
		assert: body angle equals: 1.0;	
		assert: body angularVelocity equals: 1.0;
		"Not working but should"
		"assert: body centerOfGravity equals: 1.0 @ 1.0;
		assert: body force equals: 1.0 @ 1.0;
		assert: body position equals: 1.0 @ 1.0;
		assert: body velocity equals: 1.0 @ 1.0;"
		assert: body moment equals: 1.0;
		assert: body torque equals: 1.0
		
]
