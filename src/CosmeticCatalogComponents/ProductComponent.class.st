Class {
	#name : #ProductComponent,
	#superclass : #WAComponent,
	#instVars : [
		'product'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #accessing }
ProductComponent >> brandName [ 
	^ product brandName.
]

{ #category : #accessing }
ProductComponent >> expirationDate [ 
	^ product expirationDate 
]

{ #category : #accessing }
ProductComponent >> ingredientsList [ 
	^ product ingredientsList 
]

{ #category : #initialization }
ProductComponent >> initialize [ 
	super initialize.
	product := CosmeticProduct new
]

{ #category : #accessing }
ProductComponent >> price [ 
	^ product price 
]

{ #category : #accessing }
ProductComponent >> product: aProduct [ 
	product := aProduct
]

{ #category : #accessing }
ProductComponent >> productName [ 
	^ product productName
]

{ #category : #rendering }
ProductComponent >> renderContentOn: html [
    html heading level: 2; with: self productName.
    
    html heading level: 3; with: 'Brand Name'.
    html text: self brandName.
    
    html heading level: 3; with: 'Type'.
    html text: self type.
    
    html heading level: 3; with: 'Price'.
    html text: self price asString.
    
    html heading level: 3; with: 'Ingredients List'.
    html text: self ingredientsList.
    
    html heading level: 3; with: 'Expiration Date'.
    html text: self expirationDate printString.
]

{ #category : #accessing }
ProductComponent >> type [ 
	^ product type
]
