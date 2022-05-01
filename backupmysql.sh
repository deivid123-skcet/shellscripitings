#!/bin/bash

#Diretorio onde será feito o backup
CAMINHO=

cd $CAMINHO

#Cria diretorio caso não exista
if [ ! -d backup ]
then
	mkdir backup
fi

mysqldump -u root $1 > $CAMINHO/backup/$1.sql

if [ $?  -eq 0 ]
then
	echo "Backup realizado com sucesso"
else
	echo "Houve uma falha no backup"
fi


