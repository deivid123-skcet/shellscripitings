#!/bin/bash


CAMINHO_RESTORE=/home/deividandrade/restore


aws s3 sync s3://backup-sql12/$(date +%F) $CAMINHO_RESTORE

cd  $CAMINHO_RESTORE

if [ -f $1.sql ]
then
	mysql -u root mutillidae < $1.sql
	if [ $? -eq 0 ]
	then
		echo "Restore realizado com sucesso"
	fi
else
	echo "Arquivo procurado não existe no diretorio"
fi
