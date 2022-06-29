Class {
	#name : #SmallBankTest,
	#superclass : #TestCase,
	#category : #'SmallBank-Tests'
}

{ #category : #'as yet unclassified' }
SmallBankTest >> testAmplified_0_1 [

	"SmallAmp has derived this test from `SmallBankTest>>#testWithdraw` by applying some transformations and regenerating its assertions.
	This test can:
	* It detects the injection of an artificial fault (Replace #'>=' with #>) in `SmallBank>> #withdraw:`:
		original code snippet: `balance >= amount`
		Mutated code snippet: `balance > amount`
		Dynamic state: {#balance->100. #amount->100}
"

	<madeBySmallAmp: 'Amplified_0_1'>
	| b |
	b := SmallBank new.
	b
		deposit: 100;
		withdraw: 100.
	self assert: b balance equals: 0
]

{ #category : #tests }
SmallBankTest >> testDeposit [

	| bank result |
	bank := SmallBank new.
	self assert: bank balance equals: 0.
	result := bank deposit: 100.
	self assert: bank balance equals: 100.self assert: result
]

{ #category : #tests }
SmallBankTest >> testInitialBalance [

	| bank |
	bank := SmallBank new.
	self assert: bank balance equals: 0. 
]

{ #category : #tests }
SmallBankTest >> testWithdraw [

	| bank result |
	bank := SmallBank new.
	self assert: bank balance equals: 0.
	bank deposit: 100.
	self assert: bank balance equals: 100.
	result := bank withdraw: 30.
	self assert: bank balance equals: 70.
	self assert: result.
]
