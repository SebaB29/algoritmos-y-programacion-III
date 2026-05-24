# Enunciado
<p align="justify">
Vamos a continuar trabajando con las avispas. En esta ocasión debemos dar el soporte para que nuestro cliente pueda determinar cuándo una avispa se reproduce, definir líneas genéticas y cantidad de recursos en el hábitat.
</p>

## Las orugas de Oriana y Ornella
<p align="justify">
El objetivo de las avispas es intentar reproducirse, es decir poner un huevo. Pero únicamente dejan un huevo si logran obtener del hábitat alimento para que la futura descendiente al nacer pueda nutrirse. 
 
Debemos modelar dos avispas Oriana y Ornella que con cada uno de sus huevos le dejan una oruga para que sus herederas se alimenten, pero cuando no logran conseguir ninguna oruga no ponen ningún huevo.
</p>

## Las polillas de Polly
<p align="justify">
Nuestro cliente también nos pide poder manipular otra avispa que se comporta de forma similar a las anteriores pero en lugar de obtener orugas para que se alimenten sus descendientes debe conseguir polillas. 

Nuestro trabajo es modelar a la avispa Polly que se comporte de forma similar a Oriana y Ornella pero que sus presas sean polillas en lugar de orugas.
</p>

## Trascender 
<p align="justify">
Las avispas pertenecen a una línea genética, la cual es legada a sus huevos. Debemos modificar nuestro modelo para que tanto Oriana, Ornella y Polly al poner huevos estos tengan las firmas genéticas de su progenitora. Un dato importante, es que Oriana y Ornella tienen la misma firma genética, sin embargo Polly tiene una firma diferente.
</p>

## Lara la avispa ladrona
<p align="justify">
El experto en el dominio nos contó que existen avispas que en vez de cazar orugas o polillas, le roba el nido a otra avispa y lo reemplaza por el suyo. Debemos modelar a la Avispa Lara que al intentar reproducirse proceda de esta forma. Lara tiene una firma genética diferente a las de las avispas anteriores.
</p>

# Punto de partida
<p align="justify">
Deben importar el código inicial Ejercicio1-Avispas-y-Abejas-Episodio2.CodigoInicial.st y construir su solución a partir de ahí. En dicho paquete encontrarán al objeto PruebasReproduccionDeAvispas que agrupa las pruebas de funcionamiento de las avispas. El objetivo de estas pruebas es ayudarlos/as a implementar lo pedido. En ellas encontrarán que tienen que implementar algunos métodos para poder completar las pruebas.
</p>

**Sugerencias:** 

Vayan haciendo pasar las pruebas según el orden estipulado en su numeración. 

# Preguntas para después de hacer el ejercicio

A continuación les planteamos algunas cuestiones para pensar y contestar.
Las preguntas van a ser evaluadas también.

# Sobre implementar funcionalidad:
Los tests 01, 02 y 03 demuestran la funcionalidad de cómo se incrementa la cantidad de huevos de avispas a medida que los van dejando. Cuando los implementaste,
1) ¿Esos tests pasaron (los tres) de una? 
2) ¿Podrías haber implementado esta funcionalidad de a partes, haciendo que pase el 01, luego el 01 y el 02 y por último el 01, 02 y 03?
3) ¿Se te ocurre cómo?

Y si lograste hacerlo,

4) ¿Qué pensas de implementar esa funcionalidad de esa forma?

# Sobre código repetido:
5) ¿Les quedó código repetido? ¿dónde? ¿Se animan a adivinar qué cosa del dominio les faltó representar (y por eso tienen código repetido)?
6) Responsabilidad de dejar un huevo consumiendo otro insecto ¿Quién les quedó, en su modelo, que es el responsable de ver si hay suficientes polillas u orugas y entonces dejar un huevo? ¿el insecto (Polly, Oriana, etc) o el hábitat? 
6.1) ¿Por qué? 
6.2) ¿Por qué tendría sentido que fuera de la otra forma? ¿con cuál nos quedamos?

# Sobre código repetido 2
7) Con lo que vimos en la clase del Jueves (en la parte teórica, prototipos vs clases) ¿cómo sacarían este código? Sobre la implementación 
8) ¿Cómo resolvieron guardar los huevos? 
9) ¿Usaron colecciones? ¿Diccionarios? ¿Uno, varios? ¿con qué indexaban? Pero la pregunta más importante: ¿es lo más sencillo que hacía falta? ¿o se podía hacer menos y todo andaba?


# Respuestas

<div align="justify">

### Sobre implementar funcionalidad:
1) No pasaron de una.
2) Si se puede.
3) Para que pase solo el primer test, tuvimos que inicializar la cantidadDeHuevosDeAvispas en 0.
   Después para que pase el primero y el segundo, para que hacerQueElHabitatTengaLosRecursosSuficientes, tuvimos inicializar la cantidad de orugas en 1 y luego de reproducirse, decrementamos la cantidad de orugas e incrementamos la cantidadDeHuevosDeAvispa.
   Luego para que pase el primero, el segundo y el tercero, debo restaurar la cantidadDeHUevosDeAvispas en 0 nuevamente y también para que hacerQueElHabitatTengaLosRecursosSuficientes, tuvimos que inicializar la cantidad de orugas en 2.
4) Según uno de los textos que leímos, es la forma correcta de implementar el programa ya que voy haciendo "baby steps", eso es lo que hace que el programa funcione gradualmente. Sin embargo, una vez que el programa este terminado y funcione, entramos en la etapa de corracción y diseño y no al inicio.

### Sobre Código Repetido:
5) Si, quedó código repetido en los test. Además de los test, no consideramos que tuviesemos código repetido ni tampoco algún dominio del problema sin representar, por lo tanto, si bien hay código repetido, no repetir ese código complejizaría el problema sin sentido alguno.
6) El responsable de ver si hay suficientes polillas y orugas para reproducirse es el determinado insecto.\
6.1. Porque el insecto es el que se va a reproducir y no el hábitat.\
6.2. Podría tener sentido, porque el hábitat es el que guarda la información de los insectos que viven en el hábitat. Nos qedamos con el insecto.

### Sobre Código Repetido 2:
7) Como dijimos anteriormente, nosotros no tenemos código repetido, porque utilizamos objetos hijos en determinados lugares, de forma tal, de que si estos objetos se comportaban similarmente, es decir, contenían un mismo mensaje con un mismo método, evitabamos repetir el código.
8) Utilizabamos contadores, uno por cada objeto avispa, con la misma firma genética.
9) No utilizamos ni colecciones ni diccionarios, indexabamos usando contadores, esto lo hicimos porque pensamos que un diccionario o una colección complejizaría el código sin motivo alguno, de forma tal que, de esta manera el código quedase más legible y autodescriptivo.
</div>