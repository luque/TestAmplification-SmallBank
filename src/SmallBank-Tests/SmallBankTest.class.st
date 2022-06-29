Class {
	#name : #SmallBankTest,
	#superclass : #TestCase,
	#category : #'SmallBank-Tests'
}

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
