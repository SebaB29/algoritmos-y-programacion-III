!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'SB 4/29/2022 14:52:28'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self comprobarSi: [customerBook addCustomerNamed: 'John Lennon'.] seEjecutaEnMenosDe: 50 * millisecond.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FS 4/30/2022 16:22:50'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |

	paulMcCartney := 'Paul McCartney'.
	customerBook := self inicializarCon: paulMcCartney .

	self comprobarSi: [customerBook removeCustomerNamed: paulMcCartney] seEjecutaEnMenosDe: 100 * millisecond.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FS 4/30/2022 14:51:09'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
		
	self cuandoElBloqueFalle: [ customerBook addCustomerNamed: ''.]	 
		falloEsperado: Error 
		Ejecutar: [ :anError |
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FS 4/30/2022 16:24:56'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := self inicializarCon: johnLennon .

	self cuandoElBloqueFalle:[ customerBook removeCustomerNamed: 'Paul McCartney'.]
	 	falloEsperado: NotFound 
		Ejecutar:  [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FS 5/1/2022 17:05:22'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|

	paulMcCartney := 'Paul McCartney'.
	customerBook := self inicializarCon: paulMcCartney .
	
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self verificarCantidadesEsperadasDe: customerBook deActive:0  deSuspended:1 . 
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FS 5/1/2022 17:05:34'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self inicializarCon: paulMcCartney .
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self verificarCantidadesEsperadasDe: customerBook deActive:0  deSuspended:0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FS 4/30/2022 16:27:24'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self inicializarCon: johnLennon .
			
	self cuandoElBloqueFalle:[ customerBook suspendCustomerNamed: 'Ringo Starr'.]
	 	falloEsperado: CantSuspend 
		Ejecutar:  [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FS 4/30/2022 16:27:38'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self inicializarCon: johnLennon .
	customerBook suspendCustomerNamed: johnLennon.
		
		self cuandoElBloqueFalle:[ customerBook suspendCustomerNamed: johnLennon.]
	 		falloEsperado: CantSuspend  
			Ejecutar:   [ :anError | 
					self assert: customerBook numberOfCustomers = 1.
					self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!CustomerBookTest methodsFor: 'verificar customers' stamp: 'FS 5/1/2022 17:04:43'!
verificarCantidadesEsperadasDe: customerBook deActive:cantActive deSuspended:cantSuspended

	self assert: cantActive equals: customerBook numberOfActiveCustomers.
	self assert: cantSuspended equals: customerBook numberOfSuspendedCustomers.
	self assert: (cantActive + cantSuspended) equals: customerBook numberOfCustomers.
	! !


!CustomerBookTest methodsFor: 'testear Velocidad de ejecucion' stamp: 'SB 4/29/2022 14:52:17'!
comprobarSi: unBloque seEjecutaEnMenosDe: tiempoEsperado

	|millisecondsBeforeRunning millisecondsAfterRunning|

	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	unBloque value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.

	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < tiempoEsperado! !


!CustomerBookTest methodsFor: 'control de errores' stamp: 'FS 4/30/2022 14:47:08'!
cuandoElBloqueFalle: unBloque falloEsperado: unError Ejecutar: bloqueAEjecutar

	[unBloque value. self fail]
		on: unError 
		do: bloqueAEjecutar.! !


!CustomerBookTest methodsFor: 'inicializar test' stamp: 'FS 4/30/2022 16:21:37'!
inicializarCon: aPerson
	
	
	|customerBook|

	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aPerson .
	^customerBook.! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'FS 4/30/2022 14:36:11'!
addCustomerNamed: aName

	self mostrarErrorSiEsInvalido: aName.
	
	self mostrarErrorSiNoExisteCustomerConNombre: aName.
	
	self añadir: aName a: active ! !

!CustomerBook methodsFor: 'customer management' stamp: 'FS 4/29/2022 18:58:49'!
numberOfActiveCustomers
	
	^active size
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'FS 4/29/2022 11:34:11'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FS 4/29/2022 18:58:42'!
numberOfSuspendedCustomers
	
	^suspended size
	
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'FS 4/30/2022 15:34:15'!
removeCustomerNamed: aName
 
	((self fueRemovido: aName De: active) | (self fueRemovido: aName De: suspended)) ifTrue: [^aName].

	^ NotFound signal.
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'FS 4/29/2022 18:55:47'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage
! !

!CustomerBook methodsFor: 'customer management' stamp: 'FS 4/29/2022 11:37:40'!
signalCustomerNameCannotBeEmpty

	self error: self class customerCanNotBeEmptyErrorMessage 
	
	
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'FS 4/29/2022 15:54:24'!
suspendCustomerNamed: aName 

	(self fueRemovido: aName  De: active) ifFalse: [^CantSuspend signal].
	
	self añadir: aName a: suspended .! !


!CustomerBook methodsFor: 'control de errores' stamp: 'FS 4/30/2022 14:33:56'!
mostrarErrorSiEsInvalido: aName

	 aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ]
	! !

!CustomerBook methodsFor: 'control de errores' stamp: 'FS 4/30/2022 14:35:50'!
mostrarErrorSiNoExisteCustomerConNombre: aName

	 ((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ]
	
! !


!CustomerBook methodsFor: 'remover y añadir' stamp: 'FS 4/29/2022 15:34:04'!
añadir: aName a: unaLista

	unaLista add: aName! !

!CustomerBook methodsFor: 'remover y añadir' stamp: 'FS 4/30/2022 15:33:40'!
fueRemovido: unNombre De: unaLista
	
	 unaLista remove:unNombre ifAbsent: [^false].
   	 ^true.
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
