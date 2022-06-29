Class {
	#name : #BankTest,
	#superclass : #TestCase,
	#category : #'Bank-Tests'
}

{ #category : #'as yet unclassified' }
BankTest >> testAmplified_0_2 [

	"SmallAmp has derived this test from `BankTest>>#testWithdraw` by applying some transformations and regenerating its assertions.
	This test can:
	* It detects the injection of an artificial fault (Nullify the arguments of message sends) in `Bank>> #deposit:`:
		original code snippet: `anAmount >= 0 ifFalse: [ Error new signal ]`
		Mutated code snippet: `MuTalkInfiniteRecursionError onCount: 1024.

anAmount >= 0 ifTrue: [ 
	balance := balance + anAmount.
	^ true ].
anAmount >= 0 ifFalse: nil`
		Dynamic state: {#anAmount->-100}
	* It detects the injection of an artificial fault (Replace #ifFalse: with #ifTrue:) in `Bank>> #deposit:`:
		original code snippet: `anAmount >= 0 ifFalse: [ Error new signal ]`
		Mutated code snippet: `anAmount >= 0 ifTrue: [ Error new signal ]`
		Dynamic state: {#anAmount->-100}
	* It detects the injection of an artificial fault (Chnage a message send with #yourself) in `Bank>> #deposit:`:
		original code snippet: `Error new signal`
		Mutated code snippet: `Error new yourself`
		Dynamic state: nil
	* It detects the injection of an artificial fault (Chnage a message send with #yourself) in `Bank>> #deposit:`:
		original code snippet: `anAmount >= 0 ifFalse: [ Error new signal ]`
		Mutated code snippet: `MuTalkInfiniteRecursionError onCount: 1024.

anAmount >= 0 ifTrue: [ 
	balance := balance + anAmount.
	^ true ].
(anAmount >= 0) yourself`
		Dynamic state: nil
	* It detects the injection of an artificial fault (Replace #ifTrue: receiver with true) in `Bank>> #deposit:`:
		original code snippet: `anAmount >= 0 ifTrue: [ 
	balance := balance + anAmount.
	^ true ]`
		Mutated code snippet: `true ifTrue: [ 
	balance := balance + anAmount.
	^ true ]`
		Dynamic state: {#anAmount->-100. #balance->0}
	* It detects the injection of an artificial fault (Replace #ifFalse: receiver with true) in `Bank>> #deposit:`:
		original code snippet: `anAmount >= 0 ifFalse: [ Error new signal ]`
		Mutated code snippet: `true ifFalse: [ Error new signal ]`
		Dynamic state: {#anAmount->-100}
"

	<madeBySmallAmp: 'Amplified_0_2'>
	| bank result |
	bank := Bank new.
	self should: [ bank deposit: -100 ] raise: Error
]

{ #category : #tests }
BankTest >> testDeposit [

	| bank result |
	bank := Bank new.
	self assert: bank balance equals: 0.
	result := bank deposit: 100.
	self assert: bank balance equals: 100.self assert: result
]

{ #category : #tests }
BankTest >> testInitialBalance [

	| bank |
	bank := Bank new.
	self assert: bank balance equals: 0. 
]

{ #category : #tests }
BankTest >> testWithdraw [

	| bank result |
	bank := Bank new.
	self assert: bank balance equals: 0.
	bank deposit: 100.
	self assert: bank balance equals: 100.
	result := bank withdraw: 30.
	self assert: bank balance equals: 70.
	self assert: result.
]
