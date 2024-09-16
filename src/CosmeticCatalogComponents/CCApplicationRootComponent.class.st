Class {
	#name : #CCApplicationRootComponent,
	#superclass : #WAComponent,
	#category : #CosmeticCatalogComponents
}

{ #category : #'class initialization' }
CCApplicationRootComponent class >> initialize [
 | app |
 app := WAAdmin register: self asApplicationAt: 'CosmeticCatalog'.
 app
 addLibrary: JQDeploymentLibrary;
 addLibrary: JQUiDeploymentLibrary;
 addLibrary: TBSDeploymentLibrary
]

{ #category : #testing }
CCApplicationRootComponent >> canBeRoot [
 ^ true
]

{ #category : #rendering }
CCApplicationRootComponent >> renderContentOn: html [
 html text: 'CosmeticCatalog'
]

{ #category : #updating }
CCApplicationRootComponent >> updateRoot: anHtmlRoot [
 super updateRoot: anHtmlRoot.
 anHtmlRoot beHtml5.
 anHtmlRoot title: 'CosmeticCatalog'
]
