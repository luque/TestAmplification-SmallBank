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

balance := balance + anAmount
	
]

{ #category : #initialization }
SmallBank >> initialize [ 
balance := 0
]

{ #category : #operations }
SmallBank >> withdraw: anAmount [

(balance >= anAmount) ifTrue: [ balance := balance - anAmount. ^ true ] ifFalse: [ ^ false ]  
]
