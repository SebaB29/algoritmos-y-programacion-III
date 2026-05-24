!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'aDepositAccount aExtractionAccount anAccount aPortfolio anAmountToTransfer anAccountDeposit aTransfer anOtherPortfolio anOtherAccount anOtherAccountDeposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SB 6/9/2022 13:29:50'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'tests transfers' stamp: 'SB 6/9/2022 13:31:06'!
test08CanTransferMoneyToAnotherAccount

	Transfer amountToTransfer: 100 * peso from: aExtractionAccount to: aDepositAccount.

	self assert: aDepositAccount balance = (100 * peso).
	self assert: aExtractionAccount balance = (-100 * peso).! !

!ReceptiveAccountTest methodsFor: 'tests transfers' stamp: 'SB 6/9/2022 13:33:12'!
test09CanNotTransferMoneyFromAnAccountToTheSameAccount

	self should: [Transfer amountToTransfer: anAmountToTransfer from: anAccount to: anAccount]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | self assert: anError messageText = Transfer canNotBeTransferredToYourself].! !

!ReceptiveAccountTest methodsFor: 'tests transfers' stamp: 'SB 6/9/2022 13:33:37'!
test10ANegativeAmountCannotBeTransferred

	self should: [Transfer amountToTransfer: (-100 * peso) from: aExtractionAccount to: aDepositAccount]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | self assert: anError messageText = Transfer canNotBeTransferredANegativeAmount].
! !

!ReceptiveAccountTest methodsFor: 'tests transfers' stamp: 'FS 6/9/2022 09:59:13'!
test11YouCanSeeTheValueOfTheTransfer

	|transfer depositLeg extractionLeg |

	transfer := Transfer amountToTransfer: anAmountToTransfer from: aExtractionAccount to: aDepositAccount.

	depositLeg := transfer depositLeg.
	extractionLeg := transfer extractionLeg.

	self assert: (aDepositAccount showValueOfTransfer: depositLeg) = anAmountToTransfer.
	self assert: (aExtractionAccount showValueOfTransfer: extractionLeg) = anAmountToTransfer.! !

!ReceptiveAccountTest methodsFor: 'tests transfers' stamp: 'FS 6/9/2022 10:00:07'!
test12YouCanSeeTheValueOfAnyRegisteredTransfer

	| amountToTransfer2 transfer1 transfer2|

	amountToTransfer2 := 150 * peso.

	transfer1 := Transfer amountToTransfer: anAmountToTransfer from: aExtractionAccount to: aDepositAccount .
	transfer2 := Transfer amountToTransfer: amountToTransfer2 from: aExtractionAccount to: aDepositAccount .
	
	self assert: (aDepositAccount showValueOfTransfer: (transfer1 depositLeg)) = anAmountToTransfer.
	self assert: (aExtractionAccount showValueOfTransfer: (transfer1 extractionLeg )) = anAmountToTransfer.

	self assert: (aDepositAccount showValueOfTransfer: (transfer2 depositLeg)) = amountToTransfer2.
	self assert: (aExtractionAccount showValueOfTransfer: (transfer2 extractionLeg )) = amountToTransfer2.! !

!ReceptiveAccountTest methodsFor: 'tests transfers' stamp: 'SB 6/9/2022 13:34:46'!
test13ItIsPossibleToKnowTheCounterpartOfALegOfTheTransfer

	| transfer depositLeg extractionLeg|

	transfer := Transfer amountToTransfer: anAmountToTransfer from: aExtractionAccount to: aDepositAccount.

	depositLeg := transfer depositLeg.
	extractionLeg := transfer extractionLeg.

	self assert: depositLeg counterpart = extractionLeg.
	self assert: extractionLeg counterpart = depositLeg.! !


!ReceptiveAccountTest methodsFor: 'tests portfolio' stamp: 'SB 6/9/2022 13:35:54'!
test14TheBalanceOfAnEmptyPortfolioIsZero

	self assert: aPortfolio balance = 0.! !

!ReceptiveAccountTest methodsFor: 'tests portfolio' stamp: 'FS 6/9/2022 10:01:09'!
test15TheBalanceOfAPortfolioWithAnAccountIsTheAccountBalance

	aPortfolio addAccount: anAccount.

	self assert: aPortfolio balance = anAccount balance.! !

!ReceptiveAccountTest methodsFor: 'tests portfolio' stamp: 'SB 6/9/2022 13:36:26'!
test16APortfolioBalanceIsTheSumOfAllBalance

	aPortfolio addAccount: anAccount.
	aPortfolio addAccount: anOtherAccount.

	self assert: aPortfolio balance = (anAccount balance + anOtherAccount balance).! !

!ReceptiveAccountTest methodsFor: 'tests portfolio' stamp: 'FS 6/9/2022 10:04:19'!
test17PortfolioReturnsTrueIfTheTransactionIsInThePortfolioAccounts

	aPortfolio addAccount: anAccount .

	self assert: (aPortfolio anyAccountHasRegisteredATransaction: anAccountDeposit ) = true.! !

!ReceptiveAccountTest methodsFor: 'tests portfolio' stamp: 'SB 6/9/2022 13:36:53'!
test18PortfolioReturnsFalseIfTheTransactionIsNotInThePortfolioAccounts

	aPortfolio addAccount: anAccount.

	self assert: 	(aPortfolio anyAccountHasRegisteredATransaction: anOtherAccountDeposit) = false .! !

!ReceptiveAccountTest methodsFor: 'tests portfolio' stamp: 'SB 6/9/2022 13:37:02'!
test19ThePortfolioCanShowAllTransactionOfAnAccount

	aPortfolio addAccount: anAccount.

	self assert: (aPortfolio showTransactionsOf: anAccount) = (OrderedCollection with: anAccountDeposit).! !

!ReceptiveAccountTest methodsFor: 'tests portfolio' stamp: 'SB 6/9/2022 13:37:10'!
test20ThePortfolioCanNotShowAllTransactionOfAnAccountThatIsNotRegistered

	aPortfolio addAccount: anOtherAccount.

	self should: [aPortfolio showTransactionsOf: anAccount]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |self assert: anError messageText = Portfolio accountDoNotBelongToPortfolio].! !

!ReceptiveAccountTest methodsFor: 'tests portfolio' stamp: 'FS 6/9/2022 10:31:50'!
test21APortfolioCanContainAnOtherPortfolio

	anOtherPortfolio addAccount: anAccount.

	aPortfolio addAccount: anOtherPortfolio.

	self assert: aPortfolio balance = (500 * peso).! !


!ReceptiveAccountTest methodsFor: 'test portfolio extra' stamp: 'FS 6/9/2022 10:22:42'!
test22AnAccountCanNotBeAddedTwiceInTheSamePortfolio

	aPortfolio addAccount: anAccount.
	self should: [aPortfolio addAccount: anAccount]
	       raise: Error -MessageNotUnderstood 
	       withExceptionDo: [:anError | self assert: anError messageText = 
							   Portfolio canNotAddAnAccountThatHasBeenRegisteredInThePortfolio].! !

!ReceptiveAccountTest methodsFor: 'test portfolio extra' stamp: 'FS 6/9/2022 10:30:22'!
test23AnAccountCantBeAddedToAPortfolioIfItBelongsToAPortfoliosSon

	anOtherPortfolio addAccount: anAccount.
	aPortfolio addAccount: anOtherPortfolio.
	
	self should: [aPortfolio addAccount: anAccount]
	       raise: Error -MessageNotUnderstood 
	       withExceptionDo: [:anError | self assert: anError messageText = 
							   Portfolio canNotAddAnAccountThatHasBeenRegisteredInThePortfolio].! !

!ReceptiveAccountTest methodsFor: 'test portfolio extra' stamp: 'FS 6/9/2022 10:18:54'!
test24APortfolioCanNotBeAddedToHimself

	self should: [aPortfolio addAccount: aPortfolio]
	       raise: Error -MessageNotUnderstood 
	       withExceptionDo: [:anError | self assert: anError messageText = Portfolio canNotAddHimself].! !

!ReceptiveAccountTest methodsFor: 'test portfolio extra' stamp: 'FS 6/9/2022 10:30:40'!
test25AnAccountCantBeAddedToAPortfolioIfTheAccountBelongsToThePortfoliosFather

	aPortfolio addAccount: anAccount.
	aPortfolio addAccount: anOtherPortfolio.
	
	self should: [anOtherPortfolio addAccount: anAccount]
	       raise: Error -MessageNotUnderstood 
	       withExceptionDo: [:anError | self assert: anError messageText =
							   Portfolio canNotAddAnAccountThatHasBeenRegisteredInThePortfolio].! !

!ReceptiveAccountTest methodsFor: 'test portfolio extra' stamp: 'FS 6/9/2022 10:30:56'!
test26APortfolioCantBeAddedToAnotherPortfolioIfBothHaveAnAccountInCommon

	aPortfolio addAccount: anAccount.
	anOtherPortfolio addAccount: anAccount.
	
	self should: [aPortfolio addAccount: anOtherPortfolio]
	       raise: Error -MessageNotUnderstood 
	       withExceptionDo: [:anError | self assert: anError messageText = 
							   Portfolio canNotAddAnAccountThatHasBeenRegisteredInThePortfolio].! !


!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'SB 6/9/2022 13:38:13'!
setUp
	
	anAmountToTransfer := 100 * peso.

	aDepositAccount :=ReceptiveAccount new.
	aExtractionAccount := ReceptiveAccount new .
	
	anAccount := ReceptiveAccount new.
	anAccountDeposit := Deposit register: 500 * peso on: anAccount.
	
	anOtherAccount := ReceptiveAccount new.
	anOtherAccountDeposit := Deposit register: 500 * peso on: anOtherAccount.
	
	aPortfolio := Portfolio new.
	anOtherPortfolio := Portfolio new.
	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'SB 6/9/2022 13:16:33'!
affectBalance

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'SB 6/9/2022 13:16:55'!
value 

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'SB 6/9/2022 13:17:37'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'SB 6/9/2022 13:20:51'!
initializeFor: aValue

	value := aValue.! !


!Deposit methodsFor: 'value' stamp: 'SB 6/9/2022 13:16:46'!
affectBalance

	^self value.! !

!Deposit methodsFor: 'value' stamp: 'SB 6/9/2022 13:16:29'!
value

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'SB 6/9/2022 13:17:33'!
for: aValue

	^ self new initializeFor: aValue.! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'SB 6/9/2022 13:21:00'!
initializeFor: aValue

	value := aValue.! !


!TransferDeposit methodsFor: 'value' stamp: 'SB 6/9/2022 13:16:59'!
affectBalance

	^self value.! !

!TransferDeposit methodsFor: 'value' stamp: 'FS 6/7/2022 11:43:26'!
value

	^value.! !


!TransferDeposit methodsFor: 'counterpart' stamp: 'SB 6/7/2022 16:37:28'!
allocateCounterpart: aTransferWithdraw

	counterpart := aTransferWithdraw.! !

!TransferDeposit methodsFor: 'counterpart' stamp: 'SB 6/7/2022 16:31:43'!
counterpart

	^counterpart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'SB 6/9/2022 13:17:29'!
for: aValue

	^ self new initializeFor: aValue.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'SB 6/9/2022 13:20:44'!
initializeFor: aValue

	value := aValue.! !


!TransferWithdraw methodsFor: 'value' stamp: 'SB 6/9/2022 13:17:06'!
affectBalance

	^self value negated.! !

!TransferWithdraw methodsFor: 'value' stamp: 'FS 6/7/2022 11:43:31'!
value

	^value.! !


!TransferWithdraw methodsFor: 'counterpart' stamp: 'SB 6/7/2022 16:37:28'!
allocateCounterpart: aTransferDeposit

	counterpart := aTransferDeposit.
! !

!TransferWithdraw methodsFor: 'counterpart' stamp: 'SB 6/7/2022 16:35:36'!
counterpart

	^counterpart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'SB 6/9/2022 13:17:25'!
for: aValue

	^ self new initializeFor: aValue.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'SB 6/9/2022 13:21:19'!
initializeFor: aValue

	value := aValue.! !


!Withdraw methodsFor: 'value' stamp: 'SB 6/9/2022 13:17:12'!
affectBalance

	^self value negated.! !

!Withdraw methodsFor: 'value' stamp: 'SB 6/9/2022 13:17:15'!
value

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'SB 6/9/2022 13:17:20'!
for: aValue

	^ self new initializeFor: aValue.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'anAccountGroup father'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'FS 6/8/2022 12:06:23'!
initialize

	anAccountGroup := OrderedCollection new.
	father := nil.! !


!Portfolio methodsFor: 'nuevos' stamp: 'SB 6/9/2022 13:21:47'!
IfIsAPortFoliosSon: aPortfolioElement

	(self hasAFather) ifTrue: [self giveMeYourFather addAccount: aPortfolioElement].! !

!Portfolio methodsFor: 'nuevos' stamp: 'FS 6/8/2022 12:06:25'!
giveMeYourFather

	^father.! !

!Portfolio methodsFor: 'nuevos' stamp: 'SB 6/9/2022 13:23:11'!
hasAFather

	^father ~= nil.! !

!Portfolio methodsFor: 'nuevos' stamp: 'SB 6/9/2022 13:25:17'!
ifIsAPortfolioAndHasAlreadyRegisteredAnAccountThatBelongToTheMainPortfolioReturnErrorElseRegisterHimselfAsAChild: aPortfolio

	(aPortfolio isKindOf: Portfolio)
	ifTrue: [(anAccountGroup anySatisfy: [:account | aPortfolio isTheSameThat: account])
			ifTrue: [self error: Portfolio canNotAddAnAccountThatHasBeenRegisteredInThePortfolio].
			aPortfolio registerAFather: self].! !

!Portfolio methodsFor: 'nuevos' stamp: 'SB 6/9/2022 13:26:15'!
ifIsHimselfReturnAnError: aPortfolioElement

	(aPortfolioElement isEqualTo: self) ifTrue: [self error: Portfolio canNotAddHimself].! !

!Portfolio methodsFor: 'nuevos' stamp: 'SB 6/9/2022 13:26:46'!
ifTheAccountAlreadyExistInThePortfolioReturnAnError: anAccount

	(self isTheSameThat: anAccount)
	ifTrue: [self error: Portfolio canNotAddAnAccountThatHasBeenRegisteredInThePortfolio].! !

!Portfolio methodsFor: 'nuevos' stamp: 'SB 6/9/2022 13:27:15'!
isTheSameThat: anAccount

	^anAccountGroup anySatisfy: [:aPortfolioElement | aPortfolioElement isTheSameThat: anAccount].! !


!Portfolio methodsFor: 'main protocol' stamp: 'FS 6/8/2022 15:46:46'!
addAccount: aPortfolioElement

	self ifIsHimselfReturnAnError: aPortfolioElement.

	self
	ifIsAPortfolioAndHasAlreadyRegisteredAnAccountThatBelongToTheMainPortfolioReturnErrorElseRegisterHimselfAsAChild:
	aPortfolioElement .

	self ifTheAccountAlreadyExistInThePortfolioReturnAnError: aPortfolioElement.

	self IfIsAPortFoliosSon: aPortfolioElement.

	anAccountGroup add: aPortfolioElement.! !

!Portfolio methodsFor: 'main protocol' stamp: 'SB 6/7/2022 17:17:28'!
anyAccountHasRegisteredATransaction: aTransaction

	^anAccountGroup anySatisfy: [: account | account hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'main protocol' stamp: 'SB 6/7/2022 16:07:59'!
balance

	anAccountGroup ifEmpty: [^0].
	^anAccountGroup sum:[: account | account balance].! !

!Portfolio methodsFor: 'main protocol' stamp: 'FS 6/8/2022 12:06:24'!
registerAFather: aPortfolio

	father := aPortfolio .! !

!Portfolio methodsFor: 'main protocol' stamp: 'SB 6/7/2022 16:21:04'!
showTransactionsOf: account

	(anAccountGroup includes: account) ifFalse: [self error: Portfolio accountDoNotBelongToPortfolio].
	^account transactions.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'handling error' stamp: 'SB 6/3/2022 16:11:04'!
accountDoNotBelongToPortfolio

	^'Can not get information about an account that does not belong to the portfolio'.! !

!Portfolio class methodsFor: 'handling error' stamp: 'FS 6/8/2022 12:13:38'!
canNotAddAnAccountThatHasBeenRegisteredInThePortfolio

	^'Can not add an account that has been registered in the portfolio'.! !

!Portfolio class methodsFor: 'handling error' stamp: 'FS 6/8/2022 12:09:44'!
canNotAddHimself

	^'Can not add himself to the portfolio'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'SB 6/9/2022 13:28:48'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transfers' stamp: 'SB 6/7/2022 15:31:14'!
showValueOfTransfer: aTransfer

	|transfer|
	transfer := transactions detect:[:aTransaction | aTransfer = aTransaction].

	^transfer value.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SB 6/9/2022 13:27:45'!
balance

	^transactions sum: [:aTransaction | aTransaction affectBalance] ifEmpty: [0].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SB 6/9/2022 13:28:30'!
hasRegistered: aTransaction

	^transactions includes: aTransaction.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SB 6/9/2022 13:28:11'!
isTheSameThat: anAccount

	^self isEqualTo: anAccount.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SB 6/9/2022 13:28:24'!
register: aTransaction

	transactions add: aTransaction.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SB 6/9/2022 13:28:21'!
transactions 

	^transactions copy.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'extractionLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'SB 6/7/2022 16:37:28'!
initializeWithAValue: aValue withAnExtractionAccount: extractionAccount withADepositAccount: depositAccount

	extractionLeg := TransferWithdraw register: aValue  on: extractionAccount.
	depositLeg := TransferDeposit register: aValue on: depositAccount.

	extractionLeg allocateCounterpart: depositLeg .
	depositLeg allocateCounterpart: extractionLeg .! !


!Transfer methodsFor: 'legs' stamp: 'SB 6/9/2022 13:29:00'!
depositLeg

	^depositLeg.! !

!Transfer methodsFor: 'legs' stamp: 'SB 6/9/2022 13:29:04'!
extractionLeg

	^extractionLeg.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'SB 6/9/2022 13:19:59'!
amountToTransfer: aValue from: extractionAccount to: depositAccount

	(extractionAccount isEqualTo: depositAccount) ifTrue: [self error: Transfer canNotBeTransferredToYourself].
	(aValue < 0) ifTrue: [self error: Transfer canNotBeTransferredANegativeAmount].

	^self new initializeWithAValue: aValue withAnExtractionAccount: extractionAccount withADepositAccount: depositAccount.
	! !


!Transfer class methodsFor: 'handling error' stamp: 'SB 6/9/2022 13:18:10'!
canNotBeTransferredANegativeAmount

	^'Can not be transferred an amount lower than zero'.! !

!Transfer class methodsFor: 'handling error' stamp: 'SB 6/9/2022 13:18:14'!
canNotBeTransferredToYourself

	^'Can not be transferred to yourself'.! !
