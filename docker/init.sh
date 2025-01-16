#!/bin/bash
# docker/init.sh

# Verificar si el proyecto ya existe
if [ ! -f "/var/www/html/composer.json" ]; then
    echo "Creando nuevo proyecto Laravel..."
    composer create-project --prefer-dist laravel/laravel html
    echo "-> Inicializando...."
    cd html
    echo "Instalando dependencias"
    composer install
    php artisan key:generate
    echo "Instalacion completada"
else
    echo "El proyecto ya existe, iniciando servicios..."
    echo "-> Inicializando...."
    cd html
    echo "Actualizando componentes"
    composer install
fi

# Iniciar PHP-FPM
php-fpm
