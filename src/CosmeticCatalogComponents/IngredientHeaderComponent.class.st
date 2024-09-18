Class {
	#name : #IngredientHeaderComponent,
	#superclass : #CCHeaderComponent,
	#category : #CosmeticCatalogComponents
}

{ #category : #accessing }
IngredientHeaderComponent >> renderButtonsOn: html [ 
	html form: [ self renderGoBackButtonOn: html ]
]

{ #category : #rendering }
IngredientHeaderComponent >> renderGoBackButtonOn: html [ 
	html tbsNavbarButton
		tbsPullRight;
		callback: [ component goToProductsListView ];
		with: [
			html text: 'Go back '.
			html tbsGlyphIcon iconLogout ]
]
