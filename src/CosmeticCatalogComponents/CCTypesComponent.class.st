Class {
	#name : #CCTypesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'products',
		'types'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #accessing }
CCTypesComponent class >> types: types products: aScreen [ 
	^ self new types: types;
		products: aScreen
]

{ #category : #accessing }
CCTypesComponent >> products [ 
	^ products
	
]

{ #category : #accessing }
CCTypesComponent >> products: aComponent [ 
	products := aComponent
]

{ #category : #rendering }
CCTypesComponent >> renderContentOn: html [ 
       html div
        class: 'list-group list-group-horizontal';
        with: [
            html div
                class: 'list-group-item';
                with: [ html strong: 'All types' ].
            types do: [ :type |
                html div
                    class: 'list-group-item list-group-item-custom';
                    with: [ self renderTypeLinkOn: html with: types  ]
            ]
        ]
]

{ #category : #rendering }
CCTypesComponent >> renderTypeLinkOn: html with: aType [
	html tbsLinkifyListGroupItem
		class: 'active' if: aType = self products currentType;
		callback: [ self selectType: aType ];
		with: aType
]

{ #category : #accessing }
CCTypesComponent >> selectType: aType [
	products currentType: aType
]

{ #category : #hooks }
CCTypesComponent >> style [ 
    ^ '
    .list-group-horizontal {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }
    .list-group-horizontal .list-group-item {
        margin-right: 10px;
    }
	 .list-group-item-custom {
    	  background-color: #fff5f7; 
    	  color: #5a3d55; 
   	 	  border: 1px solid #d9b6c3; 
	 }
	 .list-group-item-custom:hover {
    	  background-color: #eec8d6; 
    	  color: #3e2a3f; 
	 }
    '

]

{ #category : #accessing }
CCTypesComponent >> types [ 
	^ types
]

{ #category : #accessing }
CCTypesComponent >> types: aCollection [ 
	types := aCollection asSortedCollection
]
