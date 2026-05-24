# Código Repetido

<div align="justify">
Este ejercicio tiene por objetivo que saquen el código repetido que encuentren en el modelo y en los tests. Por ej. entre el test01 y test02.

Los tests provistos ya funcionan, simplemente hay que sacar el código repetido y los tests deben seguir funcionando.

Se pueden modificar las clases provistas, sólo para eliminar código repetido. No se puede modificar lo que verifican los tests. O sea, sólo se puede hacer un cambio de diseño de tal manera que siga testeando lo mismo, que la funcionalidad sea la misma, pero que no haya código repetido.

Aclaración: Para hacer este ejercicio más sencillo se modela a un Customer utilizando un String en vez de una clase Customer. No es el objetivo del ejercicio que ustedes corrijan esta decisión, ni las consecuencias que trae consigo (por ej. que no se pueda agregar al CustomerBook dos Customers diferentes con el mismo nombre).

# Abstracción de los tests 01 y 02
En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

Creamos un cronómetro que mide el tiempo de ejecución de un bloque de código.

# Cómo representar en Smalltalk
¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

La forma que conocemos para representar la realidad en Smalltalk es usando objetos. Mediante los mensajes se puede abstraer más el dominio del problema de forma tal que podemos representar con mayor exactitud un ente de la realidad.

# Teoría de Naur
¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

Al crear abastracciones, quitando código repetido, les facilitaría un poco más el entendimiento del programa a aquellos nuevos programadores que se tengan que hacer cargo del programa, luego de la creación del éste, sin contar con el apoyo del equipo que posee la teoría del mismo, es decir, les sería más facil entender cada uno de los propositos del programa.
</div>