#!/bin/sh

# Caminho para o arquivo package.json
PACKAGE_JSON="package.json"

# Verifica se o arquivo package.json existe
if [[ ! -f "$PACKAGE_JSON" ]]; then
  echo "Erro: Arquivo package.json não encontrado no diretório atual."
  exit 1
fi

# Obtém o valor do campo "version" no package.json
VERSION=$(grep '"version"' "$PACKAGE_JSON" | awk -F: '{gsub(/[", ]/, "", $2); print $2}')

# Verifica se conseguiu extrair o valor da versão
if [[ -z "$VERSION" ]]; then
  echo "Erro: Não foi possível encontrar o campo 'version' no arquivo package.json."
  exit 1
fi

# Exibe o valor da versão
echo "$VERSION"
