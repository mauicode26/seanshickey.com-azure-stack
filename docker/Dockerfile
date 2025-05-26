# Kubernetes-optimized WordPress Dockerfile
FROM wordpress:6.8.1-php8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install essential PHP extensions and dependencies in a single layer
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        gd \
        zip \
        mysqli \
        pdo_mysql \
    && docker-php-ext-enable opcache \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/*

# Copy complete WordPress installation
COPY ../app/* /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html \
    && chmod -R 775 /var/www/html/wp-content \
    && chmod 600 /var/www/html/wp-config.php

# Configure Apache
RUN a2enmod rewrite headers expires

# Optimize PHP for WordPress (consider using ConfigMap in K8s)
RUN { \
    echo 'file_uploads = On'; \
    echo 'memory_limit = 256M'; \
    echo 'upload_max_filesize = 64M'; \
    echo 'post_max_size = 64M'; \
    echo 'max_execution_time = 300'; \
    echo 'opcache.enable = 1'; \
    echo 'opcache.memory_consumption = 128'; \
    echo 'opcache.max_accelerated_files = 4000'; \
    echo 'opcache.revalidate_freq = 2'; \
} > /usr/local/etc/php/conf.d/wordpress.ini

# Create uploads directory
RUN mkdir -p /var/www/html/wp-content/uploads \
    && chown -R www-data:www-data /var/www/html/wp-content/uploads \
    && chmod -R 775 /var/www/html/wp-content/uploads

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
