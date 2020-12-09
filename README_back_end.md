# Práctica IAW 3_back_end

## Creando la máquina back_end

Vamos a crear una nueva instancia de máquina virtual en AWS, podemos crear la máquina de la misma forma que hicimos en la práctica 2.

Cuando lleguemos al apartado de etiquetas podemos añadir una etiqueta que se llame Back-End para poder distinguir la máquina dle Front-End.

En el apartado "Grupos de seguridad" tenemos que asegurarnos de que tenemos el puerto ssh añadido, y además añadir el puerto de MySQL (3306), lo podemos incluir dándole al botón de añadir nueva regla y en la lista desplegable seleccionamos MYSQL/Aurora, debemos asegurarnos de que en el apartado de subred tiene puesto lo siguiente:

>0.0.0.0/0, ::/0

Para poder conectarnos desde cualquier máquina.

## Configurando la máquina back_end

Después de esto podemos lanzar la instancia y conectarnos a ella.

Una vez nos hayamos conectado descargamos el repositorio de la práctica que contiene el script y los archivos de configuración con el comando git clone.

>git clone https://github.com/vaeruiz/iaw-practica-03.git

Cuando el repositorio se haya descargado movemos el script al directorio /home/ubuntu

>mv iaw-practica-03-back_end/back_end.sh /home/ubuntu

Cuando el script se haya movido al directorio ubuntu, le añadimos el permiso de ejecución

>sudo chmod +x back_end.sh

Después de esto lo ejecutamos con:

>sudo ./back_end.sh

Y esperamos a que se instale el servidor MySQL y se realicen las configuraciones necesarias.
