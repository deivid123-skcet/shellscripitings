#!/bin/bash

convert_imagem() {
		local caminho_imagem=$1
		local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{print $1}')
		convert $imagem_sem_extensao.jpg $imagem_sem_extensão.png

}

varrer_diretorio () {
	cd $1
	for arquivo in *
	do
		local caminho_arquivo=$(find /home/deividkelvin/scripts/imagens-novos-livros -name $arquivo)
		if [ -d $caminho_arquivo ]
		then
			varrer_diretorio $caminho_arquivo
		else
			convert_imagem $caminho_arquivo
		fi
	done
}

varrer_diretorio /home/deividkelvin/scripts/imagens-novos-livros 2>erros.log
if [ $? -eq 0 ]
then
	echo "Conversao realizada com sucesso"
else
	echo "Houve um Problema na conversao"
fi
