#!/bin/bash

#Variables
DB_ROOT_PASSWD=root
IP_PRIVADA_MYSQL=172.31.27.98

# Habilitamos depuración
set -x

# Actualizar lista de paquetes
apt update

# Actualizar paquetes
apt upgrade -y

# Instalar MySQL Server
apt install mysql-server -y

#Cambiar autenticación root de MySQL
mysql -u root <<< "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$DB_ROOT_PASSWD';"

# Configurar archivo MySQL para permitir conexiones desde la IP privada del Back-end
sed -i "s/127.0.0.1/$IP_PRIVADA_MYSQL/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciar Mysql
systemctl restart mysql 

# ------------------------------------------------------------------------------
# ejecutamos el script de la base de datos de la aplicación web propuesta
# ------------------------------------------------------------------------------
cd /home/ubuntu
rm -rf iaw-practica-lamp
git clone https://github.com/josejuansanchez/iaw-practica-lamp

# Importamos el script de creación de la base de datos
mysql -u root -p$DB_ROOT_PASSWD < /home/ubuntu/iaw-practica-lamp/db/database.sql
