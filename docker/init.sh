#!/bin/bash
# docker/init.sh

# Verificar si el proyecto ya existe
if [ ! -f "composer.json" ]; then
    echo "Creando nuevo proyecto Laravel..."
    composer create-project --prefer-dist laravel/laravel .
    composer install
    php artisan key:generate
else
    echo "El proyecto ya existe, iniciando servicios..."
    composer install
fi

# Iniciar PHP-FPM
php-fpm
