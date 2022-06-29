Class {
	#name : #BaselineOfBank,
	#superclass : #BaselineOf,
	#category : #BaselineOfBank
}

{ #category : #baselines }
BaselineOfBank >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: #Bank;
			package: #'Bank-Tests'
			with: [ spec requires: #( 'Bank' ) ].
		spec group: 'default' with: #( 'Bank' 'Bank-Tests' ) ]
]
