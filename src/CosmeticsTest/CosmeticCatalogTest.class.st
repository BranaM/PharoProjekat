Class {
	#name : #CosmeticCatalogTest,
	#superclass : #TestCase,
	#instVars : [
		'catalog',
		'product',
		'firstProduct',
		'previousRepository'
	],
	#category : #CosmeticsTest
}

{ #category : #running }
CosmeticCatalogTest >> setUp [
    previousRepository := VORepository current.
    VORepository setRepository: VOMemoryRepository new.

    catalog := CosmeticCatalog current.
    catalog removeAllProducts.

    firstProduct := CosmeticProduct productName: 'Lipstick'
                            brandName: 'BrandX'
                            type: 'Makeup'
                            price: 19.99
                            ingredientsList: 'Wax, Pigment, Oil'
                            expirationDate: '2025-12-31'.
    
    catalog addProduct: firstProduct.

    product := CosmeticProduct productName: 'Face Cream'
                            brandName: 'BrandY'
                            type: 'Skincare'
                            price: 29.99
                            ingredientsList: 'Water, Glycerin, etc.'
                            expirationDate: '2024-12-31'.
    
    catalog addProduct: product.
]

{ #category : #running }
CosmeticCatalogTest >> tearDown [ 
    VORepository setRepository: previousRepository
]

{ #category : #tests }
CosmeticCatalogTest >> testAddProduct [ 
    catalog addProduct: product. 
    self assert: catalog productCount equals: 3.

]

{ #category : #tests }
CosmeticCatalogTest >> testProductCount [
    self assert: catalog productCount equals: 2.

]

{ #category : #tests }
CosmeticCatalogTest >> testProductsByType [
    self assert: (catalog productsByType: 'Skincare')
        size equals: 1.

]

{ #category : #tests }
CosmeticCatalogTest >> testRemoveAllProducts [
    catalog removeAllProducts.
    self assert: catalog productCount equals: 0.

]

{ #category : #tests }
CosmeticCatalogTest >> testRemoveProduct [ 
    catalog addProduct: product.
    self assert: catalog productCount equals: 3.
    
    catalog removeProduct: product.
    self assert: catalog productCount equals: 2.
]

{ #category : #tests }
CosmeticCatalogTest >> testSearchProductsWithIngredient [
    self assert: (catalog searchProductsWithIngredient: 'Glycerin')
        size equals: 1.

]
