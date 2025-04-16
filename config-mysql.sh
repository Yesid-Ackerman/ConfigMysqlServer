#!/bin/bash

# Actualiza el sistema
echo "Actualizando el sistema..."
sudo apt update -y
sudo apt upgrade -y

# Configura MySQL para que se inicie automáticamente al arrancar
echo "Habilitando MySQL para que se inicie al arrancar..."
sudo systemctl enable mysql

# Inicia MySQL
echo "Iniciando MySQL..."
sudo systemctl start mysql

# Configura la seguridad de MySQL
echo "Configurando la seguridad de MySQL..."
sudo mysql_secure_installation

# Establece la contraseña para el usuario root si no está configurada (contraseña: Fabrica123)
echo "Estableciendo la contraseña del usuario root..."
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Fabrica123';"

# Reinicia el servicio MySQL para aplicar cambios
echo "Reiniciando el servicio MySQL..."
sudo systemctl restart mysql

# Muestra el estado de MySQL
echo "Estado del servicio MySQL:"
sudo systemctl status mysql

# Verifica la instalación
echo "Verificando la instalación de MySQL..."
mysql -u root -p -e "SELECT VERSION();"

# Mensaje final
echo "MySQL ha sido instalado y configurado exitosamente."
