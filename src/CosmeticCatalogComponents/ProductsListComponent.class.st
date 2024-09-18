Class {
	#name : #ProductsListComponent,
	#superclass : #CCScreenComponent,
	#instVars : [
		'productComponents',
		'currentType'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #'as yet unclassified' }
ProductsListComponent >> categoriesComponent [ 
	^ CCTypesComponent
		types: self catalog allTypes
		products: self
]

{ #category : #hooks }
ProductsListComponent >> children [ [
	^ self productComponents, super children
]

]

{ #category : #accessing }
ProductsListComponent >> currentType [
	^ currentType
]

{ #category : #accessing }
ProductsListComponent >> currentType: aType [
    currentType := aType.
]

{ #category : #accessing }
ProductsListComponent >> goToAdministrationView [ [
	self call: AdminComponent new
]

]

{ #category : #initialization }
ProductsListComponent >> initialize [ 
	super initialize.
	productComponents := OrderedCollection new

]

{ #category : #accessing }
ProductsListComponent >> productComponentFor: aProduct [ [
	^ ProductComponent new product: aProduct
]

]

{ #category : #accessing }
ProductsListComponent >> productComponents [ [
	productComponents := self readSelectedProducts 
		collect: [ :each | ProductComponent new product: each ].
	^ productComponents
]

]

{ #category : #accessing }
ProductsListComponent >> readSelectedProducts [ 
	^ self currentType 
		ifNil: [ self catalog allProducts  ]
		ifNotNil: [ self catalog productsByType: self
			currentType ]
]

{ #category : #rendering }
ProductsListComponent >> renderContentOn: html [ [
	super renderContentOn: html.
	html tbsContainer: [
		html tbsRow showGrid;
			with: [
				html tbsColumn
					extraSmallSize: 12;
					smallSize: 2;
					mediumSize: 4;
					with: [
						html render: self typesComponent ].
		
			html tbsColumn
				extraSmallSize: 12;
				smallSize: 10;
				mediumSize: 8;	
				with: [
					self readSelectedProducts do: [ :p |
						html render: (self productComponentFor: p) ] ] ] ]
]

]

{ #category : #accessing }
ProductsListComponent >> typesComponent [ [
	^ CCTypesComponent
		types: self catalog allTypes
		products: self
]

]
