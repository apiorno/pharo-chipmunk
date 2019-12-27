Extension { #name : #Rectangle }

{ #category : #'*Chipmunk2D' }
Rectangle >> asCmBoundingBox [

	^ CmBoundingBox fromRectangle: self
]
