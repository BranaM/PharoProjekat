Class {
	#name : #CosmeticProductTest,
	#superclass : #TestCase,
	#category : #CosmeticsTest
}

{ #category : #tests }
CosmeticProductTest >> testCosmeticProductInitialization [
    | product |
    product := CosmeticProduct 
        productName: 'Lipstick'
        brandName: 'BrandX'
        type: 'Makeup'
        price: 19.99
        ingredientsList: 'Wax, Pigment, Oil'
        expirationDate: '2025-12-31'.

    self assert: product productName equals: 'Lipstick'.
    self assert: product brandName equals: 'BrandX'.
    self assert: product type equals: 'Makeup'.
    self assert: product price equals: 19.99.
    self assert: product ingredientsList equals: 'Wax, Pigment, Oil'.
    self assert: product expirationDate equals: '2025-12-31'.
]
