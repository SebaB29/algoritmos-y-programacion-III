!classDefinition: #HabitatDeLasAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatDeLasAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeLasAvispas class' category: 'AvispasYAbejasParte2'!
HabitatDeLasAvispas class
	instanceVariableNames: 'cantidadDeHuevosDeLaAvispaLara cantidadDePolillasEnElHabitat cantidadDeHuevosDeAvispas cantidadDeOrugasEnElHabitat cantidadDeHuevosDeLaAvispaPolly cantidadDeHuevosDeLaAvispaOrianaYOrnella'!

!HabitatDeLasAvispas class methodsFor: 'restauracion de contadores' stamp: 'SB 4/22/2022 22:47:14'!
restaurarLaCantidadDeHuevosDeLaAvispaLara

	cantidadDeHuevosDeLaAvispaLara := 0.! !

!HabitatDeLasAvispas class methodsFor: 'restauracion de contadores' stamp: 'SB 4/22/2022 22:47:20'!
restaurarLaCantidadDeHuevosDeLaAvispaPolly

	cantidadDeHuevosDeLaAvispaPolly := 0.! !

!HabitatDeLasAvispas class methodsFor: 'restauracion de contadores' stamp: 'SB 4/22/2022 22:47:23'!
restaurarLaCantidadDeHuevosDeLasAvispasOrianaYOrnella

	cantidadDeHuevosDeLaAvispaOrianaYOrnella := 0.! !

!HabitatDeLasAvispas class methodsFor: 'restauracion de contadores' stamp: 'SB 4/22/2022 22:42:45'!
restaurarLaCantidadDeHuevosEnElHabitat

	self restaurarLaCantidadDeHuevosDeLasAvispasOrianaYOrnella.
	self restaurarLaCantidadDeHuevosDeLaAvispaLara.
	self restaurarLaCantidadDeHuevosDeLaAvispaPolly.! !

!HabitatDeLasAvispas class methodsFor: 'restauracion de contadores' stamp: 'SB 4/22/2022 19:34:08'!
restaurarLaCantidadDeOrugasEnElHabitat
	cantidadDeOrugasEnElHabitat := 0.! !

!HabitatDeLasAvispas class methodsFor: 'restauracion de contadores' stamp: 'SB 4/22/2022 19:33:59'!
restaurarLaCantidadDePolillasEnElHabitat
	cantidadDePolillasEnElHabitat := 0.! !


!HabitatDeLasAvispas class methodsFor: 'huevos' stamp: 'SB 4/22/2022 22:48:42'!
cantidadDeHuevosDeAvispas

	^cantidadDeHuevosDeAvispas := cantidadDeHuevosDeLaAvispaOrianaYOrnella + cantidadDeHuevosDeLaAvispaPolly + 	cantidadDeHuevosDeLaAvispaLara.! !

!HabitatDeLasAvispas class methodsFor: 'huevos' stamp: 'SB 4/22/2022 22:48:29'!
cantidadDeHuevosDeLaAvispaLara

	^cantidadDeHuevosDeLaAvispaLara.! !

!HabitatDeLasAvispas class methodsFor: 'huevos' stamp: 'SB 4/22/2022 22:48:25'!
cantidadDeHuevosDeLaAvispaPolly

	^cantidadDeHuevosDeLaAvispaPolly.! !

!HabitatDeLasAvispas class methodsFor: 'huevos' stamp: 'SB 4/22/2022 22:48:21'!
cantidadDeHuevosDeLasAvispasOrianaYOrnella

	^cantidadDeHuevosDeLaAvispaOrianaYOrnella.! !

!HabitatDeLasAvispas class methodsFor: 'huevos' stamp: 'SB 4/22/2022 22:38:43'!
incrementarLaCantidadDeHuevosDeLaAvispaPolly

	cantidadDeHuevosDeLaAvispaPolly := cantidadDeHuevosDeLaAvispaPolly + 1.! !

!HabitatDeLasAvispas class methodsFor: 'huevos' stamp: 'SB 4/22/2022 22:38:49'!
incrementarLaCantidadDeHuevosDeLasAvispasOrianaYOrnella

	cantidadDeHuevosDeLaAvispaOrianaYOrnella := cantidadDeHuevosDeLaAvispaOrianaYOrnella + 1.! !

!HabitatDeLasAvispas class methodsFor: 'huevos' stamp: 'SB 4/22/2022 22:48:02'!
robarHuevosDelNidoDeOrianaYOrnella

	cantidadDeHuevosDeLaAvispaLara := cantidadDeHuevosDeLaAvispaLara + cantidadDeHuevosDeLaAvispaOrianaYOrnella.
	self restaurarLaCantidadDeHuevosDeLasAvispasOrianaYOrnella.! !

!HabitatDeLasAvispas class methodsFor: 'huevos' stamp: 'SB 4/22/2022 22:47:57'!
robarHuevosDelNidoDePolly

	cantidadDeHuevosDeLaAvispaLara := cantidadDeHuevosDeLaAvispaLara + cantidadDeHuevosDeLaAvispaPolly.
	self restaurarLaCantidadDeHuevosDeLaAvispaPolly.! !


!HabitatDeLasAvispas class methodsFor: 'polillas' stamp: 'SB 4/22/2022 22:46:27'!
cantidadDePolillas

	^cantidadDePolillasEnElHabitat.! !

!HabitatDeLasAvispas class methodsFor: 'polillas' stamp: 'SB 4/22/2022 22:46:23'!
incrementarLaCantidadDePolillasEnElHabitat: cantidadDePolillasASumar
	cantidadDePolillasEnElHabitat := cantidadDePolillasEnElHabitat + cantidadDePolillasASumar.! !

!HabitatDeLasAvispas class methodsFor: 'polillas' stamp: 'SB 4/22/2022 22:46:40'!
reducirLaCantidadDePolillasEnElHabitat

	cantidadDePolillasEnElHabitat := cantidadDePolillasEnElHabitat - 1.! !


!HabitatDeLasAvispas class methodsFor: 'orugas' stamp: 'SB 4/22/2022 22:32:30'!
cantidadDeOrugas

	^cantidadDeOrugasEnElHabitat .! !

!HabitatDeLasAvispas class methodsFor: 'orugas' stamp: 'SB 4/22/2022 22:46:58'!
incrementarLaCantidadDeOrugasEnElHabitat: cantidadDeOrugasASumar

	cantidadDeOrugasEnElHabitat := cantidadDeOrugasEnElHabitat + cantidadDeOrugasASumar.! !

!HabitatDeLasAvispas class methodsFor: 'orugas' stamp: 'SB 4/22/2022 22:47:04'!
reducirLaCantidadDeOrugasEnElHabitat

	cantidadDeOrugasEnElHabitat := cantidadDeOrugasEnElHabitat - 1.! !


!HabitatDeLasAvispas class methodsFor: '--** private fileout/in **--' stamp: 'SB 4/22/2022 23:10:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeLaAvispaLara := 0.
	cantidadDePolillasEnElHabitat := 1.
	cantidadDeHuevosDeAvispas := 0.
	cantidadDeOrugasEnElHabitat := 1.
	cantidadDeHuevosDeLaAvispaPolly := 0.
	cantidadDeHuevosDeLaAvispaOrianaYOrnella := 1.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'SB 4/22/2022 22:20:23'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'SB 4/22/2022 22:20:44'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'SB 4/22/2022 22:21:13'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'SB 4/22/2022 22:21:34'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'SB 4/22/2022 22:21:40'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'SB 4/22/2022 22:49:08'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'SB 4/22/2022 22:49:08'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'SB 4/22/2022 22:49:08'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.

	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'SB 4/22/2022 22:49:08'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 22:37:58'!
cantidadDeHuevosConLaFirmaGeneticaDeLara

	^HabitatDeLasAvispas cantidadDeHuevosDeLaAvispaLara .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 22:37:45'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana

	^HabitatDeLasAvispas cantidadDeHuevosDeLasAvispasOrianaYOrnella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 22:37:41'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella

	^HabitatDeLasAvispas cantidadDeHuevosDeLasAvispasOrianaYOrnella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 17:05:51'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^HabitatDeLasAvispas cantidadDeHuevosDeLaAvispaPolly .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FS 4/21/2022 19:38:55'!
habitat
	^HabitatDeLasAvispas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 19:30:33'!
hacerQueElHabitatTengaLosRecursosSuficientes

	|cantidadDeOrugasNecesarias cantidadDePolillasNecesarias|
	cantidadDeOrugasNecesarias := 2.
	cantidadDePolillasNecesarias := 1.

	HabitatDeLasAvispas incrementarLaCantidadDeOrugasEnElHabitat: cantidadDeOrugasNecesarias .
	HabitatDeLasAvispas incrementarLaCantidadDePolillasEnElHabitat: cantidadDePolillasNecesarias .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 22:51:09'!
laAvispaLara
	^laAvispaLara .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FS 4/21/2022 19:55:30'!
laAvispaOriana
	^laAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FS 4/22/2022 13:29:57'!
laAvispaOrnella
	^laAvispaOrnella .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'FS 4/22/2022 13:31:57'!
laAvispaPolly
	^laAvispaPolly .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 19:26:19'!
queElHabitatTengaDosOrugasMas
	HabitatDeLasAvispas incrementarLaCantidadDeOrugasEnElHabitat: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 19:30:33'!
queElHabitatTengaDosPolillasMas
	HabitatDeLasAvispas incrementarLaCantidadDePolillasEnElHabitat: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 19:26:19'!
queElHabitatTengaUnaOrugaMas
	HabitatDeLasAvispas incrementarLaCantidadDeOrugasEnElHabitat: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 19:30:33'!
queElHabitatTengaUnaPolillaMas
	HabitatDeLasAvispas incrementarLaCantidadDePolillasEnElHabitat: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'SB 4/22/2022 19:34:16'!
retrocederElHabitatAlInicioDeLosTiempos
	HabitatDeLasAvispas restaurarLaCantidadDeHuevosEnElHabitat .
	HabitatDeLasAvispas restaurarLaCantidadDeOrugasEnElHabitat .
	HabitatDeLasAvispas restaurarLaCantidadDePolillasEnElHabitat .! !


!classDefinition: #laAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #laAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaLara class' category: 'AvispasYAbejasParte2'!
laAvispaLara class
	instanceVariableNames: ''!

!laAvispaLara class methodsFor: 'reproduccion' stamp: 'SB 4/22/2022 22:51:49'!
intentarReproducirse

	((HabitatDeLasAvispas cantidadDeHuevosDeLasAvispasOrianaYOrnella > 0) | (HabitatDeLasAvispas cantidadDeHuevosDeLaAvispaPolly > 0)) ifTrue:
	[self ponerHuevoDeLaAvispaLara .].! !

!laAvispaLara class methodsFor: 'reproduccion' stamp: 'SB 4/22/2022 22:52:04'!
ponerHuevoDeLaAvispaLara

	"
	Como se va a poner huevos de laAvispaLara se da por hecho que se los roba a otra Avispa, por lo tanto, como en
	intentarReproducirse la avispa Lara va a fijarse primero si le puede robar huevos a las avispas Ornella y Oriana,
	si ellas tienen huevos en el nido se los roba, sino se los debe robar a laAvispaPolly.
	"
	
	(HabitatDeLasAvispas cantidadDeHuevosDeLasAvispasOrianaYOrnella > 0) ifTrue: self saquearElNidoDeOrianaYOrnella ifFalse: self saquearElNidoDePolly .! !


!laAvispaLara class methodsFor: 'saqueo' stamp: 'SB 4/22/2022 22:52:12'!
saquearElNidoDeOrianaYOrnella
	
	HabitatDeLasAvispas robarHuevosDelNidoDeOrianaYOrnella .! !

!laAvispaLara class methodsFor: 'saqueo' stamp: 'SB 4/22/2022 22:52:23'!
saquearElNidoDePolly

	HabitatDeLasAvispas robarHuevosDelNidoDePolly .! !


!classDefinition: #laAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #laAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaOriana class' category: 'AvispasYAbejasParte2'!
laAvispaOriana class
	instanceVariableNames: ''!

!laAvispaOriana class methodsFor: 'reproduccion' stamp: 'SB 4/22/2022 22:36:06'!
intentarReproducirse

	(HabitatDeLasAvispas cantidadDeOrugas > 0) ifTrue: [self ponerHuevoDeAvispaOrianaYOrnella .]! !

!laAvispaOriana class methodsFor: 'reproduccion' stamp: 'FS 4/22/2022 20:34:13'!
ponerHuevoDeAvispaOrianaYOrnella

	HabitatDeLasAvispas incrementarLaCantidadDeHuevosDeLasAvispasOrianaYOrnella .
	HabitatDeLasAvispas reducirLaCantidadDeOrugasEnElHabitat.! !


!classDefinition: #laAvispaOrnella category: 'AvispasYAbejasParte2'!
laAvispaOriana subclass: #laAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #laAvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #laAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'laAvispaPolly class' category: 'AvispasYAbejasParte2'!
laAvispaPolly class
	instanceVariableNames: ''!

!laAvispaPolly class methodsFor: 'reproduccion' stamp: 'SB 4/22/2022 22:36:16'!
intentarReproducirse

	(HabitatDeLasAvispas cantidadDePolillas > 0) ifTrue: [self ponerHuevoDeLaAvispaPolly .]! !

!laAvispaPolly class methodsFor: 'reproduccion' stamp: 'FS 4/22/2022 20:25:36'!
ponerHuevoDeLaAvispaPolly

	HabitatDeLasAvispas incrementarLaCantidadDeHuevosDeLaAvispaPolly .
	HabitatDeLasAvispas  reducirLaCantidadDePolillasEnElHabitat.! !

HabitatDeLasAvispas initializeAfterFileIn!