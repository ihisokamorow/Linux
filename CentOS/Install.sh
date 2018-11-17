# Create - 17/11/2018
#
#   ./install.sh
# https://www.microsoft.com/net/download/linux-package-manager/centos/sdk-2.1.300-preview1
#
#
#
echo "Current date : $(date) @ $(hostname)"
echo "Network configuration"


#!/bin/bash
echo "Adding new users to LDAP Server..."
<<COMMENT1
    Master LDAP server : dir1.nixcraft.net.in 
    Add user to master and it will get sync to backup server too
    Profile and active directory hooks are below
COMMENT1
echo "Searching for user..."



yum install wget
##################################

yum install -y krb5-libs
yum install -y libicu
yum install -y libunwind


###################################
#   Paquetes Basicos necesarios
###################################
#
yum -y update
yum install -y wget # Permite descargar archivos solo utilizando la URL





###################################
#       Servidor Web
###################################
#
yum -y update
echo "Servidor Web by Nginx"
echo "..."
yum install -y epel-release         # Step One — Add Nginx Repository
yum install -y nginx                # Step Two — Install Nginx
systemctl start nginx               # Step Three — Start Nginx
# systemctl stop nginx.service      # Detener el servicio
# Firewall  commands to allow HTTP and HTTPS traffic
firewall-cmd --permanent --zone=public --add-service=http 
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
# Enable Nginx to start when your system boots start
systemctl enable nginx