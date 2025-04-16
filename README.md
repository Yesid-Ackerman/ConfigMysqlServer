# 🛠️ Configuración de MySQL Server en WSL

Este repositorio contiene un script automatizado para instalar, configurar y asegurar MySQL Server dentro de tu entorno WSL (Windows Subsystem for Linux). En pocos pasos tendrás MySQL listo para usar en tus proyectos de desarrollo web.

---

## 📚 Tabla de Contenido

- [📁 Paso 1: Accede a tu carpeta de trabajo `Dev` y clona el repositorio](#-paso-1-accede-a-tu-carpeta-de-trabajo-dev-y-clona-el-repositorio)
- [▶️ Paso 2: Dar permisos de ejecución al script de MySQL](#️-paso-2-dar-permisos-de-ejecución-al-script-de-mysql)
- [🚀 Paso 3: Ejecutar el script de instalación de MySQL](#-paso-3-ejecutar-el-script-de-instalación-de-mysql)
- [🔐 Paso 4: Contraseña y autenticación del usuario root](#-paso-4-contraseña-y-autenticación-del-usuario-root)
- [🧪 Paso 5: Verificar la instalación](#-paso-5-verificar-la-instalación)
- [🛠️ Errores comunes y soluciones](#️-errores-comunes-y-soluciones)

## 📁 Paso 1: Accede a tu carpeta de trabajo Dev y clona el repositorio
Abre tu terminal de WSL y navega hasta la carpeta donde está el repositorio:
```bash
cd ~/Dev
git clone https://github.com/Yesid-Ackerman/ConfigMysqlServer.git
cd ConfigMysqlServer
```

## ▶️ Paso 2: Dar permisos de ejecución al script de MySQL
Antes de ejecutar el script, asegúrate de darle permisos de ejecución:

```bash
chmod +x config-mysql.sh

```

## 🚀 Paso 3: Ejecutar el script de instalación de MySQL
Ejecuta el script que instalará y configurará MySQL automáticamente:

```bash
./config-mysql.sh

```

## 🔐 Paso 4: Contraseña y autenticación del usuario root
Durante la configuración, el script establecerá la contraseña del usuario `root` como:

```bash
Fabrica123
```

## 🧪 Paso 5: Verificar la instalación
Puedes verificar que MySQL está instalado correctamente con:

```bash
mysql -u root -p
```
Cuando lo pida, escribe tu contraseña

## 🛠️ Errores comunes y soluciones
❌ Error: `Can't connect to local MySQL server through socket`

Causa: El servicio de MySQL no está corriendo.
```bash
sudo service mysql start

```

❌ Error: ` Access denied for user 'root'@'localhost'`

Causa: La autenticación por socket está activa o la contraseña no fue cambiada correctamente.
Solución:

-  Entra a MySQL como superusuario (si es posible):
    ```bash
        sudo mysql
    ```
-  Cambia el método de autenticación y la contraseña:
    ```bash
        ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Fabrica123' 
        FLUSH PRIVILEGES;
    ```

❌ Error: `systemctl: command not found`

Causa: WSL no usa systemd por defecto.
```bash
sudo service mysql status
```

