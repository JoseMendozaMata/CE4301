About:

Generador de números pseudo-aleatorios conocido como linear-feedback shift register (LFSR), la versión fibonacci.
Consta de un programa que, dadad una semilla para su inicio, ejecuta una cantidad de compuertas XOR deseadas para
poder generar números aleatorios.

Funcionamiento:

1. Requisitos:

Se debe contar con el simulador de procesador RISC-V Ripes, lo puede encontrar en el siguiente repositorio de github:

https://github.com/mortbopet/Ripes/releases

Seguidamente, descomprima el repositorio, encontrará un ejecutable con el nombre del programa, ejecútelo y seguidamente
haga click en la pestaña File-> Load Program -> marque la opción source file y clickee Open, luego busque 
el archivo ejercicio.s y finalmente clickee ok.

Finalmente, puede cambiar la semilla en el registro a1, esto servirá para generar diferentes números aleatorios, para
ejecutar el programa presione el botón play en la parte superior, podrá ver los números aleatorios en la sección
memoria de Ripes, desde la posición 0x100 en adelante.


