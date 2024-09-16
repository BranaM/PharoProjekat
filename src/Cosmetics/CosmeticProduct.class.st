Class {
	#name : #CosmeticProduct,
	#superclass : #Object,
	#instVars : [
		'productName',
		'brandName',
		'type',
		'price',
		'ingredientsList',
		'expirationDate'
	],
	#category : #Cosmetics
}

{ #category : #accessing }
CosmeticProduct class >> productName: aName brandName: aBrand type: aType price: aPrice ingredientsList: anIngredients expirationDate: anExpirationDate [
    | product |
    product := self new.
    product productName: aName.
    product brandName: aBrand.
    product type: aType.
    product price: aPrice.
    product ingredientsList: anIngredients.
    product expirationDate: anExpirationDate.
    ^ product
]

{ #category : #initialization }
CosmeticProduct >> brandName [
	^ brandName.
]

{ #category : #accessing }
CosmeticProduct >> brandName: aBrandName [
    brandName := aBrandName.
]

{ #category : #accessing }
CosmeticProduct >> descriptionBrandName [ 
	<magritteDescription>
	^ MAStringDescription new
		label: 'Brand Name';
		priority: 200;
		accessor: #brandName;
		beRequired;
		yourself
]

{ #category : #accessing }
CosmeticProduct >> descriptionExpirationDate [ 
	<magritteDescription>
	^ MADateDescription new
		label: 'Expiration Date';
		priority: 600;
		accessor: #expirationDate;
		beRequired;
		yourself
]

{ #category : #accessing }
CosmeticProduct >> descriptionIngredientsList [ 
	<magritteDescription>
	^ MAMemoDescription new
		label: 'Ingredients List';
		priority: 400;
		accessor: #ingredientsList;
		beRequired;
		yourself
]

{ #category : #accessing }
CosmeticProduct >> descriptionPrice [
	<magritteDescription>
	^ MANumberDescription new
		label: 'Price';
		priority: 500;
		accessor: #price;
		beRequired;
		yourself
]

{ #category : #accessing }
CosmeticProduct >> descriptionProductName [ 
	<magritteDescription>
	^ MAStringDescription new
		label: 'Product Name';
		priority: 100;
		accessor: #productName;
		beRequired;
		yourself
]

{ #category : #accessing }
CosmeticProduct >> descriptionType [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Type';
		priority: 300;
		accessor: #type;
		beRequired;
		yourself
]

{ #category : #initialization }
CosmeticProduct >> expirationDate [
	^ expirationDate.
]

{ #category : #accessing }
CosmeticProduct >> expirationDate: anExpirationDate [ 
    expirationDate := anExpirationDate.
]

{ #category : #initialization }
CosmeticProduct >> ingredientsList [
	^ ingredientsList.
]

{ #category : #accessing }
CosmeticProduct >> ingredientsList: anIngredientsList [ 
    ingredientsList := anIngredientsList.
]

{ #category : #initialization }
CosmeticProduct >> price [
	^ price.
]

{ #category : #accessing }
CosmeticProduct >> price: aPrice [
    price := aPrice.
]

{ #category : #initialization }
CosmeticProduct >> productName [
	^ productName.
]

{ #category : #accessing }
CosmeticProduct >> productName: aProductName [ 
    productName := aProductName.
]

{ #category : #initialization }
CosmeticProduct >> type [
	^ type.
]

{ #category : #accessing }
CosmeticProduct >> type: aType [ 
    type := aType.
]
