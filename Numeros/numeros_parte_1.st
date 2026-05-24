!classDefinition: #NumeroTest category: 'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:40'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:00:32'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:10'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Numero with: (Numero with: 7) over: (Numero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:01:43'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:11'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Numero with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:28'!
test10AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:03:42'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (twoFifth) * (fiveHalfs) ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:04:04'!
test14NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/1/2022 18:05:06'!
test15NegationOfFraccionIsCorrect

	self assert: (Numero with: negativeOne over: two) equals: oneHalf negated! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:29:45'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Numero with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:30:07'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Numero with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/8/2019 21:09:34'!
setUp

	zero := Numero with: 0.
	one := Numero with: 1.
	two := Numero with: 2.
	three:= Numero with: 3.
	four := Numero with: 4.
	five := Numero with: 5.
	eight := Numero with: 8.
	negativeOne := Numero with: -1.
	negativeTwo := Numero with: -2.
	
	oneHalf := Numero with: one over: two.
	oneFifth := Numero with: one over: five.
	twoFifth := Numero with: two over: five.
	twoTwentyfifth := Numero with: two over: (Numero with: 25).
	fiveHalfs := Numero with: five over: two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: 'type value numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'FS 5/3/2022 14:26:10'!
* aMultiplier 

	^self subclassResponsibility .
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FS 5/3/2022 14:25:56'!
+ anAdder 
	
	"(type = #Entero and: [anAdder type = #Entero]) ifTrue:
		[ ^self class with: value + anAdder integerValue ].
	
	(type = #Fraccion and: [anAdder type = #Fraccion]) ifTrue:
		[ | newNumerator newDenominator |
		
		newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
		newDenominator := denominator * anAdder denominator.
		
		^ self class with: newNumerator over: newDenominator ].
	
	self error: 'Tipo de número no soportado'"
	^self subclassResponsibility .
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FS 5/3/2022 14:28:08'!
negated

	^self subclassResponsibility .	! !


!Numero methodsFor: 'testing' stamp: 'FS 5/3/2022 14:26:20'!
isNegative	
	
	^self subclassResponsibility .	! !

!Numero methodsFor: 'testing' stamp: 'FS 5/3/2022 14:26:27'!
isOne

	^self subclassResponsibility .	! !

!Numero methodsFor: 'testing' stamp: 'FS 5/3/2022 14:26:34'!
isZero

	^self subclassResponsibility .	! !


!Numero methodsFor: 'initialization' stamp: 'NR 9/8/2019 20:40:14'!
initializeWith: aValue
	
	type := #Entero.
	value := aValue! !

!Numero methodsFor: 'initialization' stamp: 'NR 9/8/2019 20:40:23'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	type:=#Fraccion.
	numerator := aNumerator.
	denominator := aDenominator ! !


!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:46'!
denominator

	^denominator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:33:53'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 20:59:52'!
numerator

	^numerator! !

!Numero methodsFor: 'accessing' stamp: 'NR 9/8/2019 21:55:04'!
type
	
	^type! !


!Numero methodsFor: 'printing' stamp: 'FS 5/3/2022 14:31:49'!
printOn: aStream

	^self subclassResponsibility .	! !


!Numero methodsFor: 'comparing' stamp: 'FS 5/3/2022 15:14:52'!
= anObject

	^self subclassResponsibility.
	
	! !

!Numero methodsFor: 'comparing' stamp: 'FS 5/3/2022 14:46:30'!
hash

	^self subclassResponsibility .	! !


!Numero methodsFor: 'arithmetic operations - private' stamp: 'FS 5/3/2022 15:04:06'!
// aDivisor 

	^self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations - private' stamp: 'FS 5/3/2022 15:03:58'!
greatestCommonDivisorWith: anEntero 

	^self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !


!Numero class methodsFor: 'instance creation' stamp: 'FS 5/3/2022 14:22:23'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^Entero new initializeWith: aValue! !

!Numero class methodsFor: 'instance creation' stamp: 'FS 5/3/2022 14:22:34'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator! !


!classDefinition: #Entero category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'operaciones aritmeticas' stamp: 'FS 5/3/2022 14:17:19'!
* aMultiplier

	^self class with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'operaciones aritmeticas' stamp: 'FS 5/3/2022 14:24:53'!
+ anAdder 

	 ^self class with: value + anAdder integerValue ! !

!Entero methodsFor: 'operaciones aritmeticas' stamp: 'FS 5/3/2022 14:27:05'!
negated

	 ^self * (self class with: -1).! !


!Entero methodsFor: 'imprimir' stamp: 'FS 5/3/2022 14:29:42'!
printOn: aStream

	aStream print: value .! !


!Entero methodsFor: 'testing' stamp: 'FS 5/3/2022 14:16:29'!
isNegative

	^value < 0.! !

!Entero methodsFor: 'testing' stamp: 'FS 5/3/2022 14:16:05'!
isOne
	
	^ value = 1.! !

!Entero methodsFor: 'testing' stamp: 'FS 5/3/2022 14:15:44'!
isZero

	^value = 0.! !


!Entero methodsFor: 'operaciones aritmeticas-privadas' stamp: 'FS 5/3/2022 15:01:16'!
// aDivisor


	^self class with: value // aDivisor integerValue ! !

!Entero methodsFor: 'operaciones aritmeticas-privadas' stamp: 'FS 5/3/2022 15:03:24'!
greatestCommonDivisorWith: anEntero 

	^self class with: (value gcd: anEntero integerValue).! !


!Entero methodsFor: 'comparacion' stamp: 'FS 5/3/2022 14:44:10'!
= anObject

	^(anObject isKindOf: self class) and: [type = anObject type and: value = anObject integerValue.]
	! !

!Entero methodsFor: 'comparacion' stamp: 'FS 5/3/2022 14:45:30'!
hash

	 ^value hash.! !


!classDefinition: #Fraccion category: 'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'testing' stamp: 'FS 5/3/2022 14:20:01'!
isNegative

	^denominator < 0.! !

!Fraccion methodsFor: 'testing' stamp: 'FS 5/3/2022 14:20:24'!
isOne

	^false.! !

!Fraccion methodsFor: 'testing' stamp: 'FS 5/3/2022 14:20:29'!
isZero

	^false.! !


!Fraccion methodsFor: 'imprimir' stamp: 'FS 5/3/2022 14:31:06'!
printOn: aStream

	 aStream 
			print: numerator;
			nextPut: $/;
			print: denominator
			! !


!Fraccion methodsFor: 'comparacion' stamp: 'FS 5/3/2022 14:44:04'!
= anObject

	^(anObject isKindOf: self class) and: [type = anObject type and: (numerator * anObject denominator) = (denominator * 
		anObject numerator) ].
	! !

!Fraccion methodsFor: 'comparacion' stamp: 'FS 5/3/2022 14:45:54'!
hash

	 ^(numerator hash / denominator hash) hash.! !


!Fraccion methodsFor: 'operaciones aritmeticas' stamp: 'FS 5/3/2022 14:19:40'!
* aMultiplier

	^self class with: (numerator * aMultiplier  numerator) over: (denominator * aMultiplier  denominator).
! !

!Fraccion methodsFor: 'operaciones aritmeticas' stamp: 'FS 5/3/2022 14:25:24'!
+ anAdder 

	| newNumerator newDenominator |
		
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
		
	^ self class with: newNumerator over: newDenominator! !

!Fraccion methodsFor: 'operaciones aritmeticas' stamp: 'FS 5/3/2022 14:27:47'!
negated

	^self class with: numerator * (self class with: -1) over: denominator.! !
