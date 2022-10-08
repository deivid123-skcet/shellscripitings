#!/bin/bash

echo "Atualizando o servidor"

apt-get update
apt-get upgrade -y

echo "Instalando o servidor web..."
apt-get install apache2 -y

echo "Instalando Unzip..."
apt-get install unzip -y

echo "Baixando e Configurando site..."

cd /tmp

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip

cd linux-site-dio-main

cp -R * /var/www/html/



