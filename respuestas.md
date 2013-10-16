Práctica de Laboratorio #5 - VIRTUAL

####1) Clone el siguiente repositorio de 'github' y siga las instrucciones que se indican en el fichero 'README.md':

git@github.com:coromoto/PruebasUnitarias.git

####2) En esta tarea escriba la respuesta a las siguientes preguntas:

   #####2.1.) ¿Cuál es el error en el código del método para calcular el máximo común divisor?
```
  def gcd(u, v)
    u, v = u.abs, v.abs
    while v == 0
      u, v = v, u % v
    end
    u
  end

  puts gcd(6,3)
```
  Este código tiene un problema en la línea  "while v == 0". Para que funcione correctamente sería...
```
  def gcd(u, v)
    u, v = u.abs, v.abs
    while v != 0
      u, v = v, u % v
    end
    u
  end

  puts gcd(6,3)
```
  Si dejamos la línea "while v == 0" no se ejecutaría correctamente, devolvería siempre el primer parámetro.

   #####2.2.) ¿Qué comandos del depurador utilizó para detectarlo? Describa la sesión de depuración.

   Comandos utilizados:
   ```
   (rdb:1) b 4
   (rdb:1) n
   ```
   A continuación se lista la sesión de depuración:
   ```
   (rdb:1) b 4 				//establecemos un breakpoint en la linea 4:  u, v = v, u % v
    Set breakpoint 1 at gcd.rb:4
   (rdb:1) n				//ejecutamos el código
    gcd.rb:9: puts gcd(6,3)		//ejecuta la funcion y muestra el contenido de la ultima linea de la funcion gcd
   (rdb:1) n
    6					//solución erronea: mcd (6,3) = 3, sin embargo, el programa devuelve 6.
    ```					//¿Qué ha pasado?
					//Hemos puesto un breakpoint en la linea 4, sin embargo no ha llegado a ejecutarse porque
					//no entra en el bucle while, por lo tanto la condición de entrada debe ser errónea.


    Antes de continuar con la depuración modificamos el archivo, concretamente la línea 3: while v == 0, sustituyéndola     por while v != 0 y volvemos a ejecutar el depurador.
    ```
    gcd.rb:1:def gcd(u, v)
    (rdb:1) b 4				//una vez mas, establecesmos un breakpoint en la linea 4:  u, v = v, u % v
    Set breakpoint 1 at gcd.rb:4
    (rdb:1) n				//ejecutamos el programa
    gcd.rb:9: puts gcd(6,3)
    (rdb:1) n
    Breakpoint 1, gcd at gcd.rb:4
    gcd.rb:4:    u, v = v, u % v	//esta vez es correcto: salta el breakpoint que habíamos establecido en la línea 4
    ```					//porque esta vez la condición del while es la correcta.
   
   #####2.3.) Escriba la dirección 'HTTP' del repositorio que contiene el desarrollo de su práctica.
   
   https://github.com/alu0100207385/pract05.git