FROM php:8.2-fpm

# Install required dependencies
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    wget \
    git \
    libpq-dev


# Install PHP extensions
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql


# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html
