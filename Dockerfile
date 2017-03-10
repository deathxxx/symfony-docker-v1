FROM php:7-apache
RUN apt-get update && apt-get install -y \
        git \
        libxml2-dev \
        zlib1g-dev \
        mc \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*
        
# Basic lumen packages
RUN docker-php-ext-install \
        xml \
        zip

# Set the timezone.
RUN echo "Asia/Bishkek" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# removing default witing logs to stdout
RUN rm -rf /var/log/apache2/access.log \
    rm -rf /var/log/apache2/error.log \
    rm -rf /var/log/apache2/other_vhosts_access.log


# Add php.ini for production
COPY php/php.ini-production $PHP_INI_DIR/php.ini
COPY apache/apache2.conf /etc/apache2/apache2.conf

#  Configuring Apache
RUN  rm /etc/apache2/sites-available/000-default.conf \
         && rm /etc/apache2/sites-enabled/000-default.conf

# Enable rewrite module
RUN a2enmod rewrite

WORKDIR /var/www/html


# Add vendor binaries to PATH
ENV PATH=/var/www/html/vendor/bin:$PATH

# copy my script to main folder
COPY bash/* /var/www/

