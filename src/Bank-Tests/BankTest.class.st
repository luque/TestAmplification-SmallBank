Class {
	#name : #BankTest,
	#superclass : #TestCase,
	#category : #'Bank-Tests'
}

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
