#!/bin/bash

memoria_total=$(free  | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free  | grep -i mem | awk '{ print $3 }')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{print $1}')



#echo $memoria_total
#echo $memoria_consumida
if [ $relacao_memoria_atual_total -gt 45 ]
then
	mail -s "Consumo de memoria acima do limite" deividkelven1@hotmail.com<<del
	consumo de memoria atual $(free -h | grep -i mem | awk '{ print $3 }')
del
fi




