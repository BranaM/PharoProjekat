Class {
	#name : #CosmeticCatalog,
	#superclass : #Object,
	#instVars : [
		'products'
	],
	#category : #Cosmetics
}

{ #category : #accessing }
CosmeticCatalog class >> createDemoProducts [
        | catalog |
        catalog := self current.
        catalog addProduct: (CosmeticProduct productName: 'Face Cream'
            brandName: 'BrandX'
            type: 'Moisturizer'
            price: 29.99
            ingredientsList: 'Water, Glycerin, etc.'
            expirationDate: '2024-12-31').
        catalog addProduct: (CosmeticProduct productName: 'Shampoo'
            brandName: 'BrandY'
            type: 'Hair Care'
            price: 19.99
            ingredientsList: 'Water, Sodium Laureth Sulfate, etc.'
            expirationDate: '2023-11-30').
]

{ #category : #initialization }
CosmeticCatalog class >> current [ 
	^ self selectAll
	ifNotEmpty: [ :x | x anyOne ]
	ifEmpty: [ self new save; yourself ]
]

{ #category : #initialization }
CosmeticCatalog class >> initialize [
        self reset.
]

{ #category : #initialization }
CosmeticCatalog class >> initializeVoyageOnMemoryDB [
        VOMemoryRepository new enableSingleton.
   
]

{ #category : #testing }
CosmeticCatalog class >> isVoyageRoot [ 
        ^ true.
    
]

{ #category : #initialization }
CosmeticCatalog class >> reset [ 
        self initializeVoyageOnMemoryDB.
   
]

{ #category : #adding }
CosmeticCatalog >> addProduct: aProduct [
        products add: aProduct.
        aProduct save.
        self save.
]

{ #category : #accesing }
CosmeticCatalog >> allProducts [ 
	products ifNil: [ products := OrderedCollection new ].
	^ products



]

{ #category : #testing }
CosmeticCatalog >> hasProduct: aProduct [
    ^ products includes: aProduct
]

{ #category : #initialization }
CosmeticCatalog >> initialize [
	super initialize. 
   products := OrderedCollection new
]

{ #category : #accesing }
CosmeticCatalog >> productCount [ 
    ^ products size
]

{ #category : #accesing }
CosmeticCatalog >> productsByCategory: aCategory [
    ^ products select: [ :product | product category = aCategory ]
]

{ #category : #'private ' }
CosmeticCatalog >> productsByType: aType [
	products ifNil: [ products := OrderedCollection new ].
	^ products select: [ :product | product type = aType ]


]

{ #category : #removing }
CosmeticCatalog >> removeAllProducts [
	products do: [ :each | each remove ].
	products := OrderedCollection new.
	self save. 
]

{ #category : #removing }
CosmeticCatalog >> removeProduct: aProduct [
   products remove: aProduct ifAbsent: [ ].
	self save.

]

{ #category : #accesing }
CosmeticCatalog >> searchProductsWithIngredient: anIngredient [
    ^ products select: [ :product | product ifNotNil: [ product ingredientsList includesSubstring: anIngredient ] ]

]
