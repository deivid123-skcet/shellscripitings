#!/bin/bash

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
	cat /home/deividandrade/Downloads/apache.log | grep $1
	if [ $? -ne 0 ]
	then
		echo "Valor não encontrado!"
	fi

else
	echo "Formato não é valido"
fi
