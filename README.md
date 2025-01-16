<img src="https://github.com/hecalderong/laravel-docker/blob/main/image/dockerizando-laravel.webp" alt="Dockerizando Laravel" width="100%">

# Laravel Docker Development Environment

Este proyecto proporciona un entorno de desarrollo completo para Laravel usando Docker, con todos los servicios necesarios configurados y listos para usar.

## 📋 Tabla de Contenidos

- [Requisitos Previos](#requisitos-previos)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Servicios Incluidos](#servicios-incluidos)
- [Configuración Inicial](#configuración-inicial)
- [Uso](#uso)
- [Configuración de Servicios](#configuración-de-servicios)
- [Comandos Útiles](#comandos-útiles)
- [Solución de Problemas](#solución-de-problemas)

## 🔧 Requisitos Previos

- Docker (versión 20.10 o superior)
- Docker Compose (versión 2.0 o superior)
- Git (opcional)

## 📁 Estructura del Proyecto

```
proyecto/
├── docker/
│   ├── nginx/
│   │   └── conf.d/
│   │       └── app.conf
│   └── init.sh
├── src/                 # Código fuente de Laravel
├── docker-compose.yml
└── Dockerfile
```

## 🚀 Servicios Incluidos

### 1. Aplicación Laravel (PHP-FPM)
- PHP 8.2 con FPM
- Composer preinstalado
- Extensiones PHP necesarias configuradas
- Volumen persistente para el código fuente

### 2. Nginx
- Servidor web configurado para Laravel
- Proxy inverso
- Configuración optimizada para PHP-FPM
- Puerto: 8000 (configurable)

### 3. MySQL
- Versión: 8.0
- Persistencia de datos configurada
- Puerto: 3306
- Credenciales configurables

### 4. PHPMyAdmin
- Interfaz web para administración de MySQL
- Puerto: 8080 (configurable)
- Acceso directo a la base de datos

## ⚙️ Configuración Inicial

1. Clona el repositorio o crea la estructura de directorios:
```bash
mkdir -p mi-proyecto/docker/nginx/conf.d
cd mi-proyecto
```

2. Copia los archivos de configuración proporcionados:
- `docker-compose.yml` en la raíz
- `Dockerfile` en la raíz
- `app.conf` en `docker/nginx/conf.d/`
- `init.sh` en `docker/`

3. Asegúrate que el script de inicio tenga permisos de ejecución:
```bash
chmod +x docker/init.sh
```

## 🚀 Uso

### Primera Ejecución

```bash
docker-compose up --build -d
```

Este comando:
1. Construirá las imágenes necesarias
2. Creará un nuevo proyecto Laravel si no existe
3. Instalará las dependencias
4. Iniciará todos los servicios

### Ejecuciones Posteriores

```bash
docker-compose up -d
```

### Detener los Servicios

```bash
docker-compose down
```

## 🔧 Configuración de Servicios

### Laravel
- Ubicación del código: `./src`
- URL: `http://localhost:8000`

### MySQL
- Host: `db`
- Puerto: `3306`
- Base de datos: `laravel_db`
- Usuario: `laravel_user`
- Contraseña: `user_password`
- Root Password: `root_password`

### PHPMyAdmin
- URL: `http://localhost:8080`
- Usuario: `laravel_user`
- Contraseña: `user_password`

## 📝 Comandos Útiles

### Acceder al Contenedor de Laravel
```bash
docker-compose exec app bash
```

### Ejecutar Artisan
```bash
docker-compose exec app php artisan [comando]
```

### Ver Logs
```bash
docker-compose logs -f [servicio]
```

### Reconstruir Contenedores
```bash
docker-compose up --build -d
```

## 🔍 Solución de Problemas

### Problemas de Permisos
Si encuentras problemas de permisos:
```bash
sudo chown -R $USER:$USER src/
chmod -R 755 src/storage src/bootstrap/cache
```

### Error de Conexión a MySQL
Si la aplicación no puede conectar a MySQL:
1. Verifica que el servicio esté corriendo:
```bash
docker-compose ps
```
2. Comprueba las credenciales en el `.env`
3. Asegúrate que el host sea `db` en la configuración

### Errores de Composer
Si hay problemas con Composer:
```bash
docker-compose exec app composer install --no-scripts
docker-compose exec app composer dump-autoload
```

## 🔒 Seguridad

- Cambia las contraseñas por defecto antes de usar en producción
- Revisa los permisos de los archivos
- Actualiza regularmente las imágenes de Docker
- No exponer los puertos de MySQL en producción

## 📦 Personalización

### Modificar Puertos
En `docker-compose.yml`:
```yaml
ports:
  - "nuevo_puerto:80"  # Para nginx
  - "nuevo_puerto:80"  # Para phpmyadmin
```

### Añadir Extensiones PHP
En `Dockerfile`:
```dockerfile
RUN docker-php-ext-install nombre_extension
```

### Modificar Configuración de Nginx
Edita `docker/nginx/conf.d/app.conf`

## 🤝 Contribuir

1. Fork el proyecto
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request