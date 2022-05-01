#!/bin/bash

NOME_CONTAINER=""
IMAGEM_DOCKER=""
EMAIL=""
URL="http://localhost"
DIR=""

retorno=$(curl --write-out "%{http_code}\n" --silent --output /dev/null $URL)

if [[ $retorno -ne 200 ]]
then
mail -s "Problema no container apache" $EMAIL<<del
Houve um problema no servidor e não está retornando o status 200.
del
       docker rm -f $NOME_CONTAINER && docker run -d --name $NOME_CONTAINER -p 80:80 -v $DIR:$DIR  $IMAGEM_DOCKER
fi


