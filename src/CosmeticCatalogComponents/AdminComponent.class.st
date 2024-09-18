Class {
	#name : #AdminComponent,
	#superclass : #CCScreenComponent,
	#instVars : [
		'report'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #hooks }
AdminComponent >> children [ 
	^ super children copyWith: self report
]

{ #category : #acccessing }
AdminComponent >> createHeaderComponent [ 
	^ AdminHeaderComponent from: self
]

{ #category : #acccessing }
AdminComponent >> goToProductsListView [ 
	self answer
]

{ #category : #initalize }
AdminComponent >> initialize [ 
	super initialize.
	self report: (ProductReport from: self catalog)
]

{ #category : #rendering }
AdminComponent >> renderContentOn: html [ 
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Cosmetic Products Admin'.
		html horizontalRule.
		html render: self report ]
]

{ #category : #acccessing }
AdminComponent >> report [ 
	^ report
]

{ #category : #acccessing }
AdminComponent >> report: aReport [
	report := aReport
]
