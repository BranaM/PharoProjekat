Class {
	#name : #ProductWithIngredientReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'catalog'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #'instance creation' }
ProductWithIngredientReport class >> from: aCatalog ingredient: anIngredient [ 
    | report products |
    products := aCatalog searchProductsWithIngredient: anIngredient.
    report := self rows: products description: products anyOne magritteDescription.
    report catalog: aCatalog.
    ^ report
]

{ #category : #accessing }
ProductWithIngredientReport >> catalog [ 
	^ catalog
]

{ #category : #accessing }
ProductWithIngredientReport >> catalog: aCatalog [ 
	catalog := aCatalog
]
