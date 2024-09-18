Class {
	#name : #ProductWithIngredientsComponent,
	#superclass : #CCScreenComponent,
	#instVars : [
		'products',
		'ingredientInput',
		'report'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #hooks }
ProductWithIngredientsComponent >> children [ 
	^ super children copyWith: self report
]

{ #category : #accesing }
ProductWithIngredientsComponent >> createHeaderComponent [ 
	^ IngredientHeaderComponent from: self
]

{ #category : #accesing }
ProductWithIngredientsComponent >> goToProductsListView [
	self answer
]

{ #category : #accesing }
ProductWithIngredientsComponent >> ingredientInput [ 
	^ ingredientInput
]

{ #category : #accesing }
ProductWithIngredientsComponent >> ingredientInput: anInput [ 
    ingredientInput := anInput
]

{ #category : #initialization }
ProductWithIngredientsComponent >> initialize [ 
	super initialize.
]

{ #category : #rendering }
ProductWithIngredientsComponent >> renderContentOn: html [ 
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Products with ingredient'.
		html horizontalRule.
		html form: [
			html paragraph: [  
				html text: 'Ingredient: '.
				ingredientInput := html textInput
					id: 'ingredientInput';
					yourself.
				html submitButton              
					callback: [ self report: (ProductWithIngredientReport from: self catalog ingredient: ingredientInput value) ];
					with: 'Search'.
			]
		].
		html render: self report
	]
]

{ #category : #accesing }
ProductWithIngredientsComponent >> report [ 
	^ report 
]

{ #category : #accesing }
ProductWithIngredientsComponent >> report: aReport [ 
	report := aReport 
]
