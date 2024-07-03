#!/bin/bash

#nome do projeto
projeto=$1

#parte do texto que precisa ser filtrado
conteudo_cat=$(cat pom.xml |grep -n "<artifactId>$projeto</artifactId>")

#pegar a linha que esta o nome do projeto, e a proxima linha (como padrao) sera a versao do mesmo
linha=$(echo "$conteudo_cat" | grep -oE '[0-9]+')

#pegar a proxima linha que possui a tag versao
linha=$(expr $linha + 1)

conteudo=$(sed -n "${linha}p" pom.xml)

versao=$(echo "$conteudo" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')

echo "$versao"