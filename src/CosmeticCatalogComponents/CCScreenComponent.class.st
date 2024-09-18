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

{ #category : #accesing }
CCScreenComponent >> createHeaderComponent [ 
	^ CCHeaderComponent from: self
]

{ #category : #initialize }
CCScreenComponent >> initialize [ 
	super initialize.
	header := self createHeaderComponent
]

{ #category : #rendering }
CCScreenComponent >> renderContentOn: html [ 
	html render: header
]
