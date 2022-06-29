Class {
	#name : #BankTest,
	#superclass : #TestCase,
	#category : #'Bank-Tests'
}

{ #category : #'as yet unclassified' }
BankTest >> testAmplified_0_1 [

	"SmallAmp has derived this test from `BankTest>>#testWithdraw` by applying some transformations and regenerating its assertions.
	This test can:
	* It detects the injection of an artificial fault (Chnage a message send with #yourself) in `Bank>> #withdraw:`:
		original code snippet: `balance >= anAmount ifFalse: [ Error new signal ]`
		Mutated code snippet: `MuTalkInfiniteRecursionError onCount: 1024.

balance >= anAmount ifTrue: [ 
	balance := balance - anAmount.
	^ true ].
(balance >= anAmount) yourself`
		Dynamic state: nil
	* It detects the injection of an artificial fault (Chnage a message send with #yourself) in `Bank>> #withdraw:`:
		original code snippet: `Error new signal`
		Mutated code snippet: `Error new yourself`
		Dynamic state: nil
	* It detects the injection of an artificial fault (Nullify the arguments of message sends) in `Bank>> #withdraw:`:
		original code snippet: `balance >= anAmount ifFalse: [ Error new signal ]`
		Mutated code snippet: `MuTalkInfiniteRecursionError onCount: 1024.

balance >= anAmount ifTrue: [ 
	balance := balance - anAmount.
	^ true ].
balance >= anAmount ifFalse: nil`
		Dynamic state: nil
	* It detects the injection of an artificial fault (Replace #ifFalse: receiver with true) in `Bank>> #withdraw:`:
		original code snippet: `balance >= anAmount ifFalse: [ Error new signal ]`
		Mutated code snippet: `true ifFalse: [ Error new signal ]`
		Dynamic state: {#balance->0. #anAmount->30}
	* It detects the injection of an artificial fault (Replace #ifTrue: receiver with true) in `Bank>> #withdraw:`:
		original code snippet: `balance >= anAmount ifTrue: [ 
	balance := balance - anAmount.
	^ true ]`
		Mutated code snippet: `true ifTrue: [ 
	balance := balance - anAmount.
	^ true ]`
		Dynamic state: {#balance->0. #anAmount->30}
	* It detects the injection of an artificial fault (Replace #ifFalse: with #ifTrue:) in `Bank>> #withdraw:`:
		original code snippet: `balance >= anAmount ifFalse: [ Error new signal ]`
		Mutated code snippet: `balance >= anAmount ifTrue: [ Error new signal ]`
		Dynamic state: {#balance->0. #anAmount->30}
"

	<madeBySmallAmp: 'Amplified_0_1'>
	| bank result |
	bank := Bank new.
	self should: [ bank withdraw: 30 ] raise: Error
]

{ #category : #'as yet unclassified' }
BankTest >> testAmplified_0_3 [

	"SmallAmp has derived this test from `BankTest>>#testWithdraw` by applying some transformations and regenerating its assertions.
	This test can:
	* It detects the injection of an artificial fault (Replace #'>=' with #>) in `Bank>> #withdraw:`:
		original code snippet: `balance >= anAmount`
		Mutated code snippet: `balance > anAmount`
		Dynamic state: {#balance->30. #anAmount->30}
"

	<madeBySmallAmp: 'Amplified_0_3'>
	| bank result |
	bank := Bank new.
	result := bank
		          deposit: 30;
		          withdraw: 30.
	self assert: bank balance equals: 0
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
