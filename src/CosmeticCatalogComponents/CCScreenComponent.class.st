Class {
	#name : #CCScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #accesing }
CCScreenComponent >> catalog [ 
	^ CosmeticCatalog current 
]

{ #category : #hooks }
CCScreenComponent >> children [ 
	^ { header }
]

{ #category : #rendering }
CCScreenComponent >> renderContentOn: html [ 
	html render: header
]
