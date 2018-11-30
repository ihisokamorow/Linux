#!/bin/sh
# This is a comment!
#sleep 5
#C:\Windows\System32\drivers\etc\hosts 
#C:\Users\UserName\.ssh\known_hosts
clear
#echo "==========================================================================="
#echo ""
#echo ""
#echo "  System Information: "
#echo ""
echo "      User:" $USER
echo "      Host Name:" $HOSTNAME
#echo ""
#echo ""
#echo "==========================================================================="
#
#
#
###################################
#   Configuraciones Globales
###################################
#
echo "SELinux Desactivado."
setenforce 0 #Disable "0" Enable "1"
#
#
#

echo "==========================================================================="
echo ""
echo ""
echo "      Loading System Update...."
echo ""
yum install update -y
echo ""
echo ""

###################################
#   Paquetes Basicos necesarios
###################################
#

yum update -y
yum install wget -y # Permite descargar archivos solo utilizando la URL
yum update -y
yum install git -y  # GIT
yum update -y  
yum install curl -y # 
yum update -y 
#
#
#
###################################
#       Servidor Web
###################################
# 
# Servidor Web by Nginx
yum update -y
yum install epel-release -y         # Step One — Add Nginx Repository
yum install nginx -y                # Step Two — Install Nginx
systemctl start nginx               # Step Three — Start Nginx
# systemctl stop nginx.service      # Detener el servicio
# Firewall  commands to allow HTTP and HTTPS traffic
firewall-cmd --permanent --zone=public --add-service=http 
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
# Enable Nginx to start when your system boots start
systemctl enable nginx
# Reload
service nginx reload
# Status
service nginx status
#Version
nginx -v
# Si el servidor no arranca correctamente o muestra errores, podemos comprobar su configuración:
/usr/sbin/nginx -t
# o bien, indicando el fichero de configuración
/usr/sbin/nginx -c /etc/nginx/nginx.conf -t

#Configuración del servidor
#/etc/nginx: El directorio de configuración de Nginx. Todos los archivos de configuración de Nginx residen aquí.
#/etc/nginx/nginx.conf: El archivo de configuración principal de Nginx. Esto se puede modificar para realizar cambios en la configuración global de Nginx.
#/etc/nginx/sites-available/: El directorio donde se pueden almacenar los "bloques de servidor" por sitio. Nginx no utilizará los archivos de configuración que se encuentran en este directorio a menos que estén vinculados al sites-enableddirectorio (ver más abajo). Normalmente, toda la configuración de bloqueo del servidor se realiza en este directorio y, a continuación, se habilita mediante el enlace al otro directorio.
#/etc/nginx/sites-enabled/: El directorio donde se almacenan los "bloques de servidor" habilitados por sitio. Normalmente, estos se crean al vincular a los archivos de configuración que se encuentran en el sites-availabledirectorio.
#/etc/nginx/snippets: Este directorio contiene fragmentos de configuración que pueden incluirse en cualquier otro lugar de la configuración de Nginx. Los segmentos de configuración potencialmente repetibles son buenos candidatos para refactorizar en fragmentos.
#
#Registros del servidor
#/var/log/nginx/access.log: Todas las solicitudes a su servidor web se registran en este archivo de registro, a menos que Nginx esté configurado para hacer lo contrario.
#/var/log/nginx/error.log: Cualquier error Nginx será registrado en este registro.
#---------------------------------
# Web server Path
mkdir -p /var/www/nginx/sites-available/default/public_html
mkdir -p /var/www/nginx/sites-disable/clients
#mkdir -p /var/www/example2.com/public_html
#mkdir -p /var/www/example3.com/public_html
#mkdir -p /var/www/Default/public_html
# 
#
###################################
#       Firewall
###################################
# 
# /usr/share/nginx/html 

#Verificar estado firewall (firewalld)
systemctl status firewalld

#Detener firewall (firewalld)  stop - start
systemctl stop firewalld

#Deshabilitar firewall (firewalld) - No cargar al inicio   disable - enable
systemctl disable firewalld

###################################
#       DOTNET Software Developer KIT
###################################
# 
# DotNET
sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
sudo yum update -y
sudo yum install -y dotnet-sdk-2.1