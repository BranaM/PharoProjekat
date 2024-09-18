Class {
	#name : #CCHeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #'instance creation' }
CCHeaderComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself
]

{ #category : #accessing }
CCHeaderComponent >> component [ 
	^ component
]

{ #category : #accessing }
CCHeaderComponent >> component: anObject [ 
	component := anObject
]

{ #category : #rendering }
CCHeaderComponent >> renderAdminButtonOn: html [
	html form: [
		html tbsNavbarButton
			tbsPullRight;
			callback: [ component goToAdministrationView ];
			with: [
				html tbsGlyphIcon iconListAlt.
				html text: ' Admin View' ]]
]

{ #category : #rendering }
CCHeaderComponent >> renderBrandOn: html [ 
	html tbsNavbarHeader: [
		html tbsNavbarBrand
			url: self application url;
			with: 'CosmeticCatalog' ]
]

{ #category : #accessing }
CCHeaderComponent >> renderButtonsOn: html [ 
	self renderAdminButtonOn: html.
	self renderIngredientButtonOn: html

]

{ #category : #rendering }
CCHeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [
		html tbsContainer: [
			self renderBrandOn: html.
			self renderButtonsOn: html
	]] 
]

{ #category : #rendering }
CCHeaderComponent >> renderIngredientButtonOn: html [
	html form: [
		html tbsNavbarButton
			tbsPullRight;
			callback: [ component goToIngredientView ];
			with: [
				html tbsGlyphIcon iconListAlt.
				html text: ' Search View ' ]] 
]
