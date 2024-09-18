Class {
	#name : #CCApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #CosmeticCatalogComponents
}

{ #category : #testing }
CCApplicationRootComponent class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
CCApplicationRootComponent class >> initialize [
	| app |
	app := WAAdmin register: self asApplicationAt: 'CosmeticCatalog'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary.
]

{ #category : #hooks }
CCApplicationRootComponent >> children [ 
	^ { main }
]

{ #category : #initialization }
CCApplicationRootComponent >> initialize [ 
	super initialize.
	main := ProductsListComponent new 
]

{ #category : #accessing }
CCApplicationRootComponent >> main: aComponent [ 
	main := aComponent
]

{ #category : #rendering }
CCApplicationRootComponent >> renderContentOn: html [
 html text: main
]

{ #category : #updating }
CCApplicationRootComponent >> updateRoot: anHtmlRoot [
 super updateRoot: anHtmlRoot.
 anHtmlRoot beHtml5.
 anHtmlRoot title: 'CosmeticCatalog'
]
