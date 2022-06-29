Class {
	#name : #SmallBankTest,
	#superclass : #TestCase,
	#category : #'SmallBank-Tests'
}

{ #category : #tests }
SmallBankTest >> testDeposit [

	| bank |
	bank := SmallBank new.
	self assert: bank balance equals: 0.
	bank deposit: 100.
	self assert: bank balance equals: 100.
]

{ #category : #tests }
SmallBankTest >> testInitialBalance [

	| bank |
	bank := SmallBank new.
	self assert: bank balance equals: 0. 
]

{ #category : #tests }
SmallBankTest >> testWithdraw [

	| bank |
	bank := SmallBank new.
	self assert: bank balance equals: 0.
	bank deposit: 100.
	self assert: bank balance equals: 100.
	bank withdraw: 30.
	self assert: bank balance equals: 70
]
