Extension { #name : #Point }

{ #category : #'*Chipmunk2D' }
Point >> asCmVector [

	^ CmVector fromPoint: self
]
