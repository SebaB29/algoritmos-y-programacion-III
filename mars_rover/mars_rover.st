!classDefinition: #MarsRoverTest category: 'Algoritmos3-TPMarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRoverConOrientacionNorte marsRoverConOrientacionSur marsRoverConOrientacionEste marsRoverConOrientacionOeste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!MarsRoverTest methodsFor: 'inicializar' stamp: 'SB 5/31/2022 16:34:17'!
setUp

	marsRoverConOrientacionNorte := MarsRover with: (0 @ 0) with: 'N'.
	marsRoverConOrientacionSur := MarsRover with: (0 @ 0) with: 'S'.
	marsRoverConOrientacionEste := MarsRover with: (0 @ 0) with: 'E'.
	marsRoverConOrientacionOeste := MarsRover with: (0 @ 0) with: 'O'.! !


!MarsRoverTest methodsFor: 'Avanzar' stamp: 'SB 5/31/2022 16:35:06'!
test01MarsRoverAvanzaConOrientacionNorte

	marsRoverConOrientacionNorte ejecutarComando: 'f'.
	self assert: (marsRoverConOrientacionNorte posicion = (0 @ 1)).
	! !

!MarsRoverTest methodsFor: 'Avanzar' stamp: 'SB 5/31/2022 16:45:39'!
test02MarsRoverAvazaConOrientacionEste

	marsRoverConOrientacionEste ejecutarComando: 'f'.
	self assert: (marsRoverConOrientacionEste posicion = (1 @ 0)).

	! !

!MarsRoverTest methodsFor: 'Avanzar' stamp: 'SB 5/31/2022 16:45:45'!
test03MarsRoverAvazaConOrientacionOeste

	marsRoverConOrientacionOeste ejecutarComando: 'f'.
	self assert: (marsRoverConOrientacionOeste posicion = (-1 @ 0)).! !

!MarsRoverTest methodsFor: 'Avanzar' stamp: 'SB 5/31/2022 16:45:52'!
test04MarsRoverAvazaConOrientacionSur

	marsRoverConOrientacionSur ejecutarComando: 'f'.
	self assert: (marsRoverConOrientacionSur posicion = (0 @ -1)).! !


!MarsRoverTest methodsFor: 'Retroceder' stamp: 'SB 5/31/2022 16:46:23'!
test05MarsRoverRetrocedeConOrientacionNorte

	marsRoverConOrientacionNorte ejecutarComando: 'b'.
	self assert: (marsRoverConOrientacionNorte posicion = (0 @ -1)).
	! !

!MarsRoverTest methodsFor: 'Retroceder' stamp: 'SB 5/31/2022 16:47:06'!
test06MarsRoverRetrocedeConOrientacionEste

	marsRoverConOrientacionEste ejecutarComando: 'b'.
	self assert: (marsRoverConOrientacionEste posicion = (-1 @ 0)).
	! !

!MarsRoverTest methodsFor: 'Retroceder' stamp: 'SB 5/31/2022 16:47:39'!
test07MarsRoverRetrocedeConOrientacionOeste

	marsRoverConOrientacionOeste ejecutarComando: 'b'.
	self assert: (marsRoverConOrientacionOeste posicion = (1 @ 0)).
	! !

!MarsRoverTest methodsFor: 'Retroceder' stamp: 'SB 5/31/2022 16:47:55'!
test08MarsRoverRetrocedeConOrientacionSur

	marsRoverConOrientacionSur ejecutarComando: 'b'.
	self assert: (marsRoverConOrientacionSur posicion = (0 @ 1)).
	! !


!MarsRoverTest methodsFor: 'Rotar Derecha' stamp: 'SB 5/31/2022 16:50:59'!
test09MarsRoverConOrientacionNorteRotaALaDerechaYTieneOrientacionEste

	marsRoverConOrientacionNorte ejecutarComando: 'r'.
	self assert: (marsRoverConOrientacionNorte orientacion isKindOf: Este).
	! !

!MarsRoverTest methodsFor: 'Rotar Derecha' stamp: 'SB 5/31/2022 16:55:27'!
test10MarsRoverConOrientacionEsteRotaALaDerechaYTieneOrientacionSur

	marsRoverConOrientacionEste ejecutarComando: 'r'.
	self assert: (marsRoverConOrientacionEste orientacion isKindOf: Sur).
	! !

!MarsRoverTest methodsFor: 'Rotar Derecha' stamp: 'SB 5/31/2022 17:04:58'!
test11MarsRoverConOrientacionOesteRotaALaDerechaYTieneOrientacionNorte

	marsRoverConOrientacionOeste ejecutarComando: 'r'.
	self assert: (marsRoverConOrientacionOeste orientacion isKindOf: Norte).
	! !


!MarsRoverTest methodsFor: 'Rotar Izquierda' stamp: 'SB 5/31/2022 17:14:02'!
test12MarsRoverConOrientacionOesteRotaALaIzquierdaYTieneOrientacionSur

	marsRoverConOrientacionOeste ejecutarComando: 'l'.
	self assert: (marsRoverConOrientacionOeste orientacion isKindOf: Sur).! !

!MarsRoverTest methodsFor: 'Rotar Izquierda' stamp: 'SB 5/31/2022 17:14:08'!
test13MarsRoverConOrientacionNorteRotaALaIzquierdaYTieneOrientacionOeste

	marsRoverConOrientacionNorte ejecutarComando: 'l'.
	self assert: (marsRoverConOrientacionNorte orientacion isKindOf: Oeste).! !


!MarsRoverTest methodsFor: 'Ejecucion multiple de comandos' stamp: 'SB 5/31/2022 17:19:03'!
test14MarsRoverRecibeVariosComandosYLosEjecutaCorrectamente
	
	marsRoverConOrientacionNorte ejecutarComando: 'fbrff'.
	
	self assert: marsRoverConOrientacionNorte posicion = (2@0).! !

!MarsRoverTest methodsFor: 'Ejecucion multiple de comandos' stamp: 'SB 5/31/2022 17:21:39'!
test15MarsRoverEjecutaLosComandosYDejaDeEjecutarLuegoDeRecibirUnComandoErroneo

	 [marsRoverConOrientacionNorte ejecutarComando: 'fxbrff'.]
	      on: Error
	      do: [	self assert: marsRoverConOrientacionNorte posicion = (0@1).]! !


!classDefinition: #Comandos category: 'Algoritmos3-TPMarsRover'!
Object subclass: #Comandos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!Comandos methodsFor: 'ejecucion' stamp: 'SB 5/30/2022 10:24:12'!
ejecutar: marsRover

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Comandos class' category: 'Algoritmos3-TPMarsRover'!
Comandos class
	instanceVariableNames: ''!

!Comandos class methodsFor: 'Clasificacion' stamp: 'SB 5/31/2022 17:42:16'!
aceptasMiComando: unPosibleComando

	self subclassResponsibility .! !

!Comandos class methodsFor: 'Clasificacion' stamp: 'SB 5/31/2022 17:42:49'!
asignarComando: unPosibleComando

	|unComando|
	unComando := Comandos subclasses detect: [: comando | comando aceptasMiComando: unPosibleComando ].
	^unComando new.! !


!classDefinition: #MoverHaciaAdelante category: 'Algoritmos3-TPMarsRover'!
Comandos subclass: #MoverHaciaAdelante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!MoverHaciaAdelante methodsFor: 'ejecucion' stamp: 'SB 5/30/2022 10:25:39'!
ejecutar: marsRover

	marsRover moverHaciaAdelante .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoverHaciaAdelante class' category: 'Algoritmos3-TPMarsRover'!
MoverHaciaAdelante class
	instanceVariableNames: ''!

!MoverHaciaAdelante class methodsFor: 'Clasificacion' stamp: 'SB 5/31/2022 17:41:22'!
aceptasMiComando: unPosibleComando

	^unPosibleComando = $f.! !


!classDefinition: #MoverHaciaAtras category: 'Algoritmos3-TPMarsRover'!
Comandos subclass: #MoverHaciaAtras
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!MoverHaciaAtras methodsFor: 'ejecucion' stamp: 'SB 5/30/2022 10:25:48'!
ejecutar: marsRover

	marsRover moverHaciaAtras .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoverHaciaAtras class' category: 'Algoritmos3-TPMarsRover'!
MoverHaciaAtras class
	instanceVariableNames: ''!

!MoverHaciaAtras class methodsFor: 'Clasificacion' stamp: 'SB 5/31/2022 17:41:39'!
aceptasMiComando: unPosibleComando

	^unPosibleComando = $b.! !


!classDefinition: #RotarALaDerecha category: 'Algoritmos3-TPMarsRover'!
Comandos subclass: #RotarALaDerecha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!RotarALaDerecha methodsFor: 'ejecucion' stamp: 'SB 5/30/2022 10:26:01'!
ejecutar: marsRover

	marsRover rotarHaciaLaDerecha .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotarALaDerecha class' category: 'Algoritmos3-TPMarsRover'!
RotarALaDerecha class
	instanceVariableNames: ''!

!RotarALaDerecha class methodsFor: 'Clasificacion' stamp: 'SB 5/31/2022 17:41:49'!
aceptasMiComando: unPosibleComando

	^unPosibleComando = $r.! !


!classDefinition: #RotarALaIzquierda category: 'Algoritmos3-TPMarsRover'!
Comandos subclass: #RotarALaIzquierda
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!RotarALaIzquierda methodsFor: 'ejecucion' stamp: 'SB 5/30/2022 10:26:13'!
ejecutar: marsRover

	marsRover rotarHaciaLaIzquierda .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotarALaIzquierda class' category: 'Algoritmos3-TPMarsRover'!
RotarALaIzquierda class
	instanceVariableNames: ''!

!RotarALaIzquierda class methodsFor: 'Clasificacion' stamp: 'SB 5/31/2022 17:42:07'!
aceptasMiComando: unPosibleComando

	^unPosibleComando = $l.! !


!classDefinition: #MarsRover category: 'Algoritmos3-TPMarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion orientacion orientacionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!MarsRover methodsFor: 'inicializacion' stamp: 'SB 5/31/2022 17:40:21'!
initializeWith: unaPosicion with: unaOrientacion

	orientacion := Orientacion  determinarOrientacion: unaOrientacion.
	posicion := unaPosicion .! !


!MarsRover methodsFor: 'ubicacion' stamp: 'SB 5/30/2022 10:46:59'!
cambiarOrientacion: nuevaOrientacion
	orientacion := nuevaOrientacion .! !

!MarsRover methodsFor: 'ubicacion' stamp: 'SB 5/30/2022 11:07:02'!
cambiarPosicion: desplazamiento
	posicion := posicion + desplazamiento.! !

!MarsRover methodsFor: 'ubicacion' stamp: 'SB 5/30/2022 10:56:53'!
orientacion
	^orientacion.! !

!MarsRover methodsFor: 'ubicacion' stamp: 'SB 5/30/2022 11:02:31'!
posicion
	^posicion.! !


!MarsRover methodsFor: 'movimiento y rotacion' stamp: 'SB 5/30/2022 11:11:18'!
moverHaciaAdelante

	orientacion desplazarHaciaAdelante: self.! !

!MarsRover methodsFor: 'movimiento y rotacion' stamp: 'SB 5/30/2022 11:11:22'!
moverHaciaAtras

	orientacion desplazarHaciaAtras: self.! !

!MarsRover methodsFor: 'movimiento y rotacion' stamp: 'SB 5/30/2022 11:02:43'!
rotarHaciaLaDerecha

	orientacion rotarDerecha: self.! !

!MarsRover methodsFor: 'movimiento y rotacion' stamp: 'SB 5/30/2022 11:02:50'!
rotarHaciaLaIzquierda

	orientacion rotarIzquierda: self.! !


!MarsRover methodsFor: 'ejecucion' stamp: 'SB 5/31/2022 17:36:46'!
ejecutarComando: unaSecuenciaDeComandos

	|unComando|
	(unaSecuenciaDeComandos asArray) do: [:caracter | 
		unComando := Comandos asignarComando: caracter.
		unComando ejecutar: self].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Algoritmos3-TPMarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'Inicializacion' stamp: 'SB 5/31/2022 17:44:16'!
with: unaPosicion with: unaOrientacion
	
	^self new initializeWith: unaPosicion with: unaOrientacion .! !


!classDefinition: #Orientacion category: 'Algoritmos3-TPMarsRover'!
Object subclass: #Orientacion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!Orientacion methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:13:42'!
desplazarHaciaAdelante: marsRover

	self subclassResponsibility .! !

!Orientacion methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:13:47'!
desplazarHaciaAtras: marsRover

	self subclassResponsibility .! !


!Orientacion methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:49:45'!
rotarDerecha: marsRover

	self subclassResponsibility .! !

!Orientacion methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:47:46'!
rotarIzquierda: marsRover

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Orientacion class' category: 'Algoritmos3-TPMarsRover'!
Orientacion class
	instanceVariableNames: ''!

!Orientacion class methodsFor: 'Clasificacion' stamp: 'FS 5/30/2022 20:46:40'!
aceptasMiOrientacion: unString

	self subclassResponsibility .! !

!Orientacion class methodsFor: 'Clasificacion' stamp: 'SB 5/31/2022 17:39:19'!
determinarOrientacion: unaOrientacion

	| orientacionAsignada |
	orientacionAsignada := Orientacion  subclasses detect:[: unaSubclase |
		 unaSubclase aceptasMiOrientacion: unaOrientacion ].

	^orientacionAsignada new.! !


!classDefinition: #Este category: 'Algoritmos3-TPMarsRover'!
Orientacion subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!Este methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:08:24'!
desplazarHaciaAdelante: marsRover

	marsRover cambiarPosicion: (1@0).! !

!Este methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:10:15'!
desplazarHaciaAtras: marsRover

	marsRover cambiarPosicion: (-1@0).! !


!Este methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:49:09'!
rotarDerecha: marsRover

	marsRover cambiarOrientacion: Sur new.! !

!Este methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:47:19'!
rotarIzquierda: marsRover

	marsRover cambiarOrientacion: Norte new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Este class' category: 'Algoritmos3-TPMarsRover'!
Este class
	instanceVariableNames: ''!

!Este class methodsFor: 'Clasificacion' stamp: 'FS 5/30/2022 20:47:16'!
aceptasMiOrientacion: unString

	^ unString = 'E'! !


!classDefinition: #Norte category: 'Algoritmos3-TPMarsRover'!
Orientacion subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!Norte methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:07:47'!
desplazarHaciaAdelante: marsRover

	marsRover cambiarPosicion: (0@1).! !

!Norte methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:10:33'!
desplazarHaciaAtras: marsRover

	marsRover cambiarPosicion: (0@-1).! !


!Norte methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:54:51'!
rotarDerecha: marsRover

	marsRover cambiarOrientacion: Este new.! !

!Norte methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:47:07'!
rotarIzquierda: marsRover

	marsRover cambiarOrientacion: Oeste new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Norte class' category: 'Algoritmos3-TPMarsRover'!
Norte class
	instanceVariableNames: ''!

!Norte class methodsFor: 'Clasificacion' stamp: 'FS 5/30/2022 20:47:25'!
aceptasMiOrientacion: unString

	^ unString = 'N'! !


!classDefinition: #Oeste category: 'Algoritmos3-TPMarsRover'!
Orientacion subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!Oeste methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:08:04'!
desplazarHaciaAdelante: marsRover

	marsRover cambiarPosicion: (-1@0).! !

!Oeste methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:10:47'!
desplazarHaciaAtras: marsRover

	marsRover cambiarPosicion: (1@0).! !


!Oeste methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:49:18'!
rotarDerecha: marsRover

	marsRover cambiarOrientacion: Norte new.! !

!Oeste methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:47:26'!
rotarIzquierda: marsRover

	marsRover cambiarOrientacion: Sur new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oeste class' category: 'Algoritmos3-TPMarsRover'!
Oeste class
	instanceVariableNames: ''!

!Oeste class methodsFor: 'Clasificacion' stamp: 'FS 5/30/2022 20:47:34'!
aceptasMiOrientacion: unString

	^ unString = 'O'! !


!classDefinition: #Sur category: 'Algoritmos3-TPMarsRover'!
Orientacion subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algoritmos3-TPMarsRover'!

!Sur methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:08:17'!
desplazarHaciaAdelante: marsRover

	marsRover cambiarPosicion: (0@-1).! !

!Sur methodsFor: 'desplazamiento' stamp: 'SB 5/30/2022 11:11:01'!
desplazarHaciaAtras: marsRover

	marsRover cambiarPosicion: (0@1).! !


!Sur methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:49:31'!
rotarDerecha: marsRover

	marsRover cambiarOrientacion: Oeste new.! !

!Sur methodsFor: 'rotacion' stamp: 'SB 5/30/2022 10:47:35'!
rotarIzquierda: marsRover

	marsRover cambiarOrientacion: Este new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sur class' category: 'Algoritmos3-TPMarsRover'!
Sur class
	instanceVariableNames: ''!

!Sur class methodsFor: 'Clasificacion' stamp: 'FS 5/30/2022 20:47:41'!
aceptasMiOrientacion: unString

	^ unString = 'S'! !
