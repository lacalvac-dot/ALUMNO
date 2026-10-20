# ALUMNO
## Instalamos el visual studio code mediante la interfaz gráfica:  https://code.visualstudio.com/docs/setup/linux

# ---------------------------------------------------------------------
# 6. VALIDACIÓN DE CONEXIÓN A AWS (SECCIÓN MANUAL POST-CONFIGURACIÓN)
# ==============================================================================
# NOTA: Para ejecutar estos comandos de validación, primero debes configurar 
# tus credenciales temporales del laboratorio ejecutando 'aws configure'.

# Comandos para logearse en el aws
# aws configure
# AWS Access Key ID [None]: <PEGA_TU_ACCESS_KEY>
# AWS Secret Access Key [None]: <PEGA_TU_SECRET_KEY>
# Default region name [None]: us-east-1
# Default output format [None]: json

# Comandos manuales de validación:
#   aws sts get-caller-identity
#   aws configure get region
#   aws s3 ls