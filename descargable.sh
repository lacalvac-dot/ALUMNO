#!/bin/bash

echo "=== 1. CREANDO ESTRUCTURA DE CARPETAS DEL CURSO ==="
mkdir -p 00-entorno/evidencias
touch 00-entorno/README.md
mkdir -p 5163-redes/terraform 5163-redes/cloudformation 5163-redes/evidencias
mkdir -p 5162-datos/terraform 5162-datos/cloudformation 5162-datos/sql 5162-datos/python 5162-datos/evidencias
mkdir -p scripts/evidencias

echo -e "\n=== 2. ACTUALIZAR SISTEMA E INSTALAR DEPENDENCIAS BÁSICAS ==="
# Instalamos Python 3, herramientas de red, descompresión y dependencias de Terraform
sudo apt update
sudo apt install -y python3 curl unzip jq git wget gnupg lsb-release

echo -e "\n=== 3. DESCARGAR E INSTALAR TERRAFORM ==="
# Repositorio e instalación oficial de HashiCorp Terraform
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

echo -e "\n=== 4. DESCARGAR E INSTALAR AWS CLI V2 ==="
# Descarga e instalación oficial de AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

echo -e "\n=== 5. COMPROBANDO VERSIONES EN TERMINAL ==="
# Verificamos que todas las herramientas respondan con su versión
git --version
aws --version
terraform -version
python3 --version
ssh -V
curl --version
jq --version

echo -e "\n=== ¡Software instalado y carpetas creadas con éxito! ==="
echo "Para validar la conexión con AWS, configura tus credenciales con 'aws configure' y ejecuta los comandos del README.md."