#!/bin/bash


convert_imagem () {
cd /home/deividkelvin/scripts/imagens-livros/cu

if [ ! -d png ] 
then

	mkdir png
fi

for imagem in *.jpg
do
	local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

convert_imagem 2>>erros.log
if [ $? -eq 0 ]
then
	echo "conversao realizada com sucesso"
else
	echo "houve uma falha no processo"
fi
