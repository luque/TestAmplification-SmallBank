Class {
	#name : #BankTest,
	#superclass : #TestCase,
	#category : #'Bank-Tests'
}

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
