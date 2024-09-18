Class {
	#name : #AdminHeaderComponent,
	#superclass : #CCHeaderComponent,
	#category : #CosmeticCatalogComponents
}

{ #category : #accessing }
AdminHeaderComponent >> renderButtonsOn: html [ 
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
AdminHeaderComponent >> renderDisconnectButtonOn: html [ 
	html tbsNavbarButton
		tbsPullRight;
		callback: [ component goToProductsListView ];
		with: [
			html text: 'Disconnect '.
			html tbsGlyphIcon iconLogout ]
]
