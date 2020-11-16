# Práctica IAW 3_front_end

## Creando la máquina front_end

Creamos una nueva instancia en AWS, el mismo SO (Ubuntu Server 20.04).

Cuando lleguemos al apartado de etiquetas podemos añadir una etiqueta que se llame Front_End para diferenciarla de la máquina Back.

En el apartado grupos de seguridad, añadiremos tres puertos nuevos, el puerto HTTP (80), HTTPS (443), y el puerto MySQL (3306), todos los campos de subred deben ser 0.0.0.0/0, ::/0.

## Configurando la máquina front_end

Cuando se haya creado la instancia y esté arrancada nos conectamos a ella y clonamos el repositorio que contiene el script para la instalación de apache y otras herramientas.

>git clone https://github.com/vaeruiz/iaw-practica-03-front_end

Una vez se haya descargado el repositorio movemos el script de instalación al directorio /home/ubuntu con el siguiente comando:

>mv iaw-practica-03-front_end/front_end.sh /home/ubuntu/

Después de mover el script al directorio le añadimos permisos de ejecución con el comando:

>sudo chmod +x front_end.sh

Y a continuación lo ejecutamos

>sudo ./front_end.sh

A pesar de que en el script se ha puesto el comando sed para poner la dirección IP pública del back en el archivo de configuración de php (config.php), no se realiza el cambio así que con el editor de texto lo cambiaremos manualmente.

>sudo nano /var/www/html/config.php

Y buscamos la cadena de texto 

>define('DB_HOST', 'localhost');

Y sustituimos localhost por la dirección ip pública de nuestra máquina back_end.

Hecho todo esto tendremos nuestra máquina preparada.