# Números

<div align="justify">

## Primera parte

Hacer file-in del archivo Numeros-Parte1-Ejercicio.st.

Como se observa, contamos con una clase Numero que representa un modelo de números. En particular soporta operaciones de enteros y de fracciones.
Contamos con una suite de tests que verifica una serie de operaciones básicas que soporta nuestro modelo.

El objetivo de esta primera parte es quitar los ifs utilizando polimorfismo, aplicando el algoritmo que vimos en clase. 

Los tests deben seguir pasando (sin modificarlos).

## Segunda parte

Para esta segunda parte, deben previamente quitar la categoría Numeros-Parte1-Ejercicio, y luego hacer file-in de Numeros-Parte2-Ejercicio.st.

Este segundo modelo presentado es una posible solución de la primera parte, pero agregando nuevas operaciones: resta, división y fibonacci.

Como podrán ver cuando corran los tests, hay varios que funcionan y son los correspondientes a cuando se opera aritméticamente entre números del mismo tipo, o sea entre enteros o entre fracciones. Los test que fallan son los relacionados a las operaciones entre números de distinto tipo, es decir, entre enteros y fracciones y viceversa.

El objetivo de este ejercicio es que implementen la suma, la resta, la multiplicación y la división entre números enteros y fraccionarios.

La solución final no debe tener if en los métodos que deben implementar y todos los test deben funcionar (sin ser modificados!).

**Pasos a seguir:**

1. Antes de empezar a resolver el problema, debuggeen los tests que funcionan para entender cómo es el modelo que se está presentando. Analicen las clases Numero, Entero y Fraccion.
2. Una vez que se sientan cómodos con el modelo, hagan pasar todos los tests implementando lo necesario utilizando ifs. 
3. Una vez que los tests pasen, apliquen el algoritmo que vimos en clase para reemplazar if por polimorfismo.

Para la entrega, deben hacer file-out de la solución a esta segunda parte. No es necesario entregar la solución a la primera parte.

**Algunas aclaraciones:**

- Las fracciones no pueden tener denominador 1. Fracciones con denominador 1 se asumen enteros.
- Los enteros no pueden responder los mensajes #numerador y #denominador ya que no son fracciones.
- Cuando se opera aritméticamente con enteros, verán que se utilizan las operaciones aritméticas provistas por el sistema. Esto es para que sea más performante.

## Desafío Adicional (opcional, no resta, sólo otorga puntos extra)

Aquellos que estén interesados en llevar al extremo el reemplazo de if por polimorfismo (y practicar para el parcial), traten de sacar los ifs que ya venían en el ejercicio inicialmente: Los tienen que ver con que no se puede dividir por cero, que el denominador no puede ser uno, casos bases de fibonacci, etc. 

Las soluciones a este desafío son muy interesantes y distintas para lenguajes de prototipación (ej. javascript) vs clasificación.


## Preguntas teóricas

# Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

En cada uno de los llamados conocemos un tipo de clase. Lo que genera conocer la clase es que desliga a los distintos objetos de conocer informacion/metodologia privada de los objetos colaboradores.
En el primer llamado se conece el tipo de clase del primer objeto 1 y en el segundo llamado se obtiene de a que clase pertence el objeto dos.

Tomando en cuenta el ejemplo de la suma, donde se encuentran dos sumandos (S1 y S2) los cuales pueden ser de diferente clase o igual entre si.

En el primer llamado, osea en el mensaje "+", conoceríamos el tipo de clase a la cual pertence S1, quien es el receptor del mensaje que se envía con S2 como colaborador. Una vez que nos encontramos situados en el mensaje, desconocemos el tipo de clase de S2 por lo tanto nos vemos forzados a implementar el método utilizando condicionales (If), creando una condición por cada tipo de clase posible del colaborador S2. A partir del segundo llamado, es donde entra la utilización del Double Dispatch.

En el segundo llamado, reemplazaríamos los condicionales por un único mensaje que va a estar en cada uno de los tipos de clase a los que puede pertencer S2 con su respectiva implementación (Que contienen cada uno de los Closures de los condicionales). Luego le enviaríamos ese mensaje a S2 conociendo su tipo de clase. Al conecer la clase a la que pertence el S2 podemos enviar el mensaje que corresponda sin necesidad de que S1 conozca la funcionalidad de S2.
También cabe destacar que podriamos utilizar el mismo mensaje con otra clase nueva, a las que podría pertenecer S2, con solo agregar el mensaje a la nueva clase, de forma tal que cuando enviemos un objeto perteneciente a esa nueva clase, como S2 no habria problema alguno.


# Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

La lógica de cómo instanciar un objeto es mejor tenerla en los métodos de clase, ya que no tendría sentido que se encuentre en los métodos de instancia, porque la responsabilidad de como crear cada instancia debería ser de la clase ya que cada una de ellas es única y no debería saber cómo crear el resto de instancias, dado que  no puede existir una instancia sin una clase por lo tanto es la clase la que se encarga de crearla. 
En caso de que se requiera crear ese objeto en distintos lados y de diferentes formas, pueden crearse métodos de inicialización dónde se enviarían mensajes internamente para ejecutar el método que tiene la lógica de cómo instanciarlo.


# Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

Para categorizar los métodos, nos fijamos en el nombre y el comportamiento de éstos, entonces agrupamos los que sean parecidos. Y en caso de ser métodos que se ejecutan mediante el envío de mensajes de forma interna, además de categorizarlos mirando las características antes mencionadas, también se los categoriza como privados, para dar a entender que son métodos que no tienen que ser utilizados ni modificados por un usuario.


# Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

Ponemos "self subclassResponsibility", por el simple hecho de que si alguna subclase no entiende el mensaje enviado, iría a buscarlo a la superclase y devolvería un error, con el que indica que la respuesta a ese mensaje depende exclusivamente de la subclase.


# No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

Romper el encapsulamiento podría afectar el diseño del programa, ya que si un objeto verificara características de otro objeto para decidir su funcionamiento podría estar excediendo sus responsabilidades. También podrían generar problemas en el funcionamiento del programa, modificando métodos privados que se ejecutan de forma interna, los cuales no deberían ser utilizados por el usuario.
</div>