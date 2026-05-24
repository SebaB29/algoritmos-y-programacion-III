!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack stackWithElements finderOfStackWithElements strings upperCasePrefix lowerCasePrefix prefix emptyPrefix finderOfEmptyStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:28:01'!
test01StatementExample

	self assert: (finderOfStackWithElements find: upperCasePrefix) first = strings last .! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:29:03'!
test02CheckingCaseSensitive

	self assert: (finderOfStackWithElements find: upperCasePrefix) first = strings last .
	self assert: (finderOfStackWithElements find: lowerCasePrefix) first = strings first .! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:29:10'!
test03FindMoreThanAnElementWithOnePrefix

	self assert: (finderOfStackWithElements find: prefix ) = (strings copyFrom: 1 to: 2).! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:29:17'!
test04CanNotFindAnyElementWithAPrefix
	
	self assert: (finderOfStackWithElements find: 'hola') size = 0 .! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:29:20'!
test05CanNotFindAnElementInEmptyStack

	self assert: (finderOfEmptyStack find: prefix) size = 0 .! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:29:29'!
test06PrefixCanNotBeEmptyString

	self
		should: [ finderOfStackWithElements find: emptyPrefix ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:29:34'!
test07CanNotFindAStringComposedWithMoreThanAWord

	self
		should: [ finderOfStackWithElements find: 'winter is' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptySpaceErrorDescription ]! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:30:22'!
test08AfterFindAPrefixStackRetainsTheSize

	self assert: stackWithElements size = 4 .
	
	finderOfStackWithElements find: prefix.

	self assert: stackWithElements size = 4 .! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:30:33'!
test09FoundAPrefixThenPopThenCanNotFound

	self assert: (finderOfStackWithElements find: upperCasePrefix) size = 1 .

	stackWithElements pop.
	finderOfStackWithElements copyStack: stackWithElements .

	self assert: (finderOfStackWithElements find: upperCasePrefix) size = 0 .! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:29:50'!
test10SearchingTwiceReturnsTheSame

	self assert: (finderOfStackWithElements find: prefix) = (finderOfStackWithElements find: prefix).! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'SB 5/14/2022 20:29:54'!
test11PrefixCanNotBeAnEmptySpace

	self
		should: [ finderOfStackWithElements find: ' ' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptySpaceErrorDescription ]! !


!SentenceFinderByPrefixTest methodsFor: 'initialize' stamp: 'SB 5/14/2022 19:41:35'!
initializeStackWithElements: stringsCollection

	stringsCollection do: [:string | stackWithElements push: string].! !


!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'SB 5/14/2022 20:28:55'!
setUp

	finderOfStackWithElements := SentenceFinderByPrefix new.
	finderOfEmptyStack := SentenceFinderByPrefix new.
	emptyStack := OOStack new.
	stackWithElements := OOStack new.
	
	prefix := 'win'.
	upperCasePrefix := 'Wint'.
	lowerCasePrefix := 'wint'.
	emptyPrefix := ''.

	strings := OrderedCollection with: 'winter is coming' with: 'winning is everything' with: 'The winds of Winter'	
			with: 'Winter is here'.
	
	self initializeStackWithElements: strings.
	
	finderOfStackWithElements copyStack: stackWithElements .
	finderOfEmptyStack copyStack: emptyStack .
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'state' stamp: 'FS 5/12/2022 21:11:31'!
isEmpty

	^stack isEmpty .! !

!OOStack methodsFor: 'state' stamp: 'SB 5/14/2022 12:02:37'!
updateMyState

	|subclass|

	subclass := StackStatus subclasses detect: [:class | class doYouAcceptMySize: self size].

	state := subclass new.! !


!OOStack methodsFor: 'basic stack operations' stamp: 'SB 5/14/2022 12:02:37'!
pop

	self updateMyState . 

	^state howDoIRemoveTheTop: self.

	


	! !

!OOStack methodsFor: 'basic stack operations' stamp: 'SB 5/14/2022 12:02:37'!
push: anElement

	stack addLast: anElement.

	self updateMyState.
	

	! !

!OOStack methodsFor: 'basic stack operations' stamp: 'FS 5/10/2022 12:38:01'!
size

	^stack size.! !

!OOStack methodsFor: 'basic stack operations' stamp: 'SB 5/14/2022 01:51:34'!
top

	^state howDoIReturnMyTop: self.! !


!OOStack methodsFor: 'initialize' stamp: 'SB 5/14/2022 12:02:37'!
initialize

	stack := OrderedCollection  new.
	
	self updateMyState .! !


!OOStack methodsFor: 'stack functions - private' stamp: 'SB 5/14/2022 01:40:16'!
removeTopOfStack

	^stack removeLast.! !

!OOStack methodsFor: 'stack functions - private' stamp: 'SB 5/14/2022 01:56:06'!
whatIsMyTop

	^stack last.! !


!OOStack methodsFor: 'error handling' stamp: 'SB 5/14/2022 01:35:44'!
raiseErrorWhenGettingTopOfEmptyStack

	self error: OOStack stackEmptyErrorDescription .! !

!OOStack methodsFor: 'error handling' stamp: 'SB 5/14/2022 01:37:51'!
raiseErrorWhenRemovingTopOfEmptyStack

	self error: OOStack stackEmptyErrorDescription .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialize' stamp: 'SB 5/14/2022 15:36:32'!
copyStack: aStack

	stack := OrderedCollection new.

	[aStack isEmpty] whileFalse: [stack addFirst: aStack pop].

	stack do: [:anElement | aStack push: anElement].! !


!SentenceFinderByPrefix methodsFor: 'error handling' stamp: 'SB 5/14/2022 20:11:54'!
ifPrefixIsEmptyReturnError: prefix

	(prefix isEmpty) ifTrue: [self error: SentenceFinderByPrefix prefixEmptyErrorDescription].! !

!SentenceFinderByPrefix methodsFor: 'error handling' stamp: 'SB 5/14/2022 20:12:11'!
ifPrefixIsEmptySpaceReturnError: prefix

	(prefix includesSubString: ' ') ifTrue: [self error: SentenceFinderByPrefix prefixEmptySpaceErrorDescription].! !


!SentenceFinderByPrefix methodsFor: 'basic operation' stamp: 'SB 5/14/2022 20:12:19'!
find: prefix

	self ifPrefixIsEmptyReturnError: prefix.

	self ifPrefixIsEmptySpaceReturnError: prefix.

	^stack select: [:s | s beginsWith: prefix].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'SB 5/14/2022 11:36:58'!
prefixEmptyErrorDescription
	
	^ 'Prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'SB 5/14/2022 16:28:53'!
prefixEmptySpaceErrorDescription
	
	^ 'Prefix can not allow empty space'! !


!classDefinition: #StackStatus category: 'Stack-Exercise'!
Object subclass: #StackStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStatus methodsFor: 'stack interaction' stamp: 'SB 5/14/2022 01:43:22'!
howDoIRemoveTheTop: aStack

	self subclassResponsibility ! !

!StackStatus methodsFor: 'stack interaction' stamp: 'SB 5/14/2022 01:45:03'!
howDoIReturnMyTop: aStack

	self subclassResponsibility 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackStatus class' category: 'Stack-Exercise'!
StackStatus class
	instanceVariableNames: ''!

!StackStatus class methodsFor: 'status checking' stamp: 'SB 5/14/2022 01:47:45'!
doYouAcceptMySize: StackSize

	self subclassResponsibility .! !


!classDefinition: #EmptyStack category: 'Stack-Exercise'!
StackStatus subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStack methodsFor: 'stack interaction' stamp: 'SB 5/14/2022 01:45:49'!
howDoIRemoveTheTop: aStack

	aStack raiseErrorWhenRemovingTopOfEmptyStack.! !

!EmptyStack methodsFor: 'stack interaction' stamp: 'SB 5/14/2022 01:45:21'!
howDoIReturnMyTop: aStack

	aStack raiseErrorWhenGettingTopOfEmptyStack .

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack-Exercise'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'status checking' stamp: 'SB 5/14/2022 01:48:23'!
doYouAcceptMySize: StackSize

	^ StackSize = 0.! !


!classDefinition: #NotEmptyStack category: 'Stack-Exercise'!
StackStatus subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmptyStack methodsFor: 'stack interaction' stamp: 'SB 5/14/2022 01:46:07'!
howDoIRemoveTheTop: aStack

	^aStack removeTopOfStack.! !

!NotEmptyStack methodsFor: 'stack interaction' stamp: 'SB 5/14/2022 01:56:06'!
howDoIReturnMyTop: aStack

	^aStack whatIsMyTop.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStack class' category: 'Stack-Exercise'!
NotEmptyStack class
	instanceVariableNames: ''!

!NotEmptyStack class methodsFor: 'status checking' stamp: 'SB 5/14/2022 01:48:39'!
doYouAcceptMySize: StackSize

	^ StackSize > 0.! !
