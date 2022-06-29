Class {
	#name : #Bank,
	#superclass : #Object,
	#instVars : [
		'balance'
	],
	#category : #Bank
}

{ #category : #accessors }
Bank >> balance [
	^ balance
]

{ #category : #operations }
Bank >> deposit: anAmount [

	anAmount >= 0 ifTrue: [ balance := balance + anAmount. ^ true ].
	anAmount >= 0 ifFalse: [ Error new signal ].
]

{ #category : #initialization }
Bank >> initialize [ 
balance := 0
]

{ #category : #operations }
Bank >> withdraw: anAmount [

	balance >= anAmount ifTrue: [ balance := balance - anAmount. ^ true ].
	balance >= anAmount ifFalse: [ Error new signal ]
]
