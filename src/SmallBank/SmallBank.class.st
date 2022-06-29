Class {
	#name : #SmallBank,
	#superclass : #Object,
	#instVars : [
		'balance'
	],
	#category : #SmallBank
}

{ #category : #accessors }
SmallBank >> balance [
	^ balance
]

{ #category : #operations }
SmallBank >> deposit: anAmount [

	(anAmount >= 0) ifTrue: [ balance := balance + anAmount ].
		(anAmount >= 0) ifFalse: [ Error new signal ]
]

{ #category : #initialization }
SmallBank >> initialize [ 
balance := 0
]

{ #category : #operations }
SmallBank >> withdraw: anAmount [

	balance >= anAmount
		ifTrue: [ balance := balance - anAmount ].
		balance >= anAmount 
		ifFalse: [ Error new signal ]
]
