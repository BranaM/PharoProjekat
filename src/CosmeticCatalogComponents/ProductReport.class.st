Class {
	#name : #ProductReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'catalog'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #'instance creation' }
ProductReport class >> from: aCatalog [
| report catalogProducts |
catalogProducts := aCatalog allProducts.
report := self rows: catalogProducts description: catalogProducts anyOne magritteDescription.
report catalog: aCatalog.
report addColumn: (MACommandColumn new 
				addCommandOn: report selector: #editProduct: text: 'Edit';
				yourself;
				addCommandOn: report selector: #deleteProduct: text: 'Delete';
				yourself).
^ report
]

{ #category : #adding }
ProductReport >> addProduct [ 
	| product |
	product := self call: (self renderAddProductForm: CosmeticProduct new).
	product ifNotNil: [ catalog addProduct: product.
		self refreshReport ]
]

{ #category : #acccessing }
ProductReport >> catalog [ 
	^ catalog
]

{ #category : #acccessing }
ProductReport >> catalog: aCatalog [
	catalog := aCatalog
]

{ #category : #acccessing }
ProductReport >> deleteProduct: aProduct [ 
	(self confirm: 'Are you sure you want to permanently remove this product?')
	ifTrue: [ catalog removeProduct: aProduct.
		self refreshReport ]
]

{ #category : #acccessing }
ProductReport >> editProduct: aProduct [ 
	| product |
	product := self call: (self renderEditProductForm: aProduct).
	product ifNotNil: [ catalog save ]
]

{ #category : #acccessing }
ProductReport >> refreshReport [ [
	self rows: catalog allProducts.
	self refresh.
]

]

{ #category : #rendering }
ProductReport >> renderAddProductForm: aProduct [ 
	^ aProduct asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Add product'. #cancel -> 'Cancel' });
		yourself
]

{ #category : #rendering }
ProductReport >> renderContentOn: html [ [
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self addProduct ];
		with: 'Add product'.
	super renderContentOn: html.
]

]

{ #category : #rendering }
ProductReport >> renderEditProductForm: aProduct [ [
	^ aProduct asComponent
		addDecoration: (TBSMagritteFormDecoration buttons: { #save -> 'Save product'. #cancel -> 'Cancel' });
		yourself
]

]
