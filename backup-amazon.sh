#!/bin/bash


CAMINHO_BKP=/home/deividandrade/backup_mutillidae_amazon
cd $CAMINHO_BKP

data=$(date +%F)

## Verificando se existe um diretorio com a data do dia do backup e criando caso nao exista
if [ ! -d $data ]
then
	mkdir  $data
fi

#filtrando somente os nomes das tabelas e fazendo o dump para o diretorio com a data
tabelas=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
	mysqldump -u root mutillidae $tabela > $CAMINHO_BKP/$data/$tabela.sql
done

aws s3 sync $CAMINHO_BKP s3://backup-sql12
