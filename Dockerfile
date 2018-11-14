FROM php:7.1-apache

# Enable mod_rewrite
RUN a2enmod rewrite

RUN apt-get update \
  && apt-get install -y \
    cron \
    vim \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libxslt1-dev

# Install composer
RUN curl https://getcomposer.org/installer | php -- && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

RUN apt-get install -y libbz2-dev && \
    docker-php-ext-install bz2

RUN apt-get install -y curl software-properties-common
RUN apt-get install -y gnupg gnupg2 gnupg1
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN npm install yarn -g \
  npm install bower -g



RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  gd \
  intl \
  mbstring \
  mcrypt \
  pdo_mysql \
  soap \
  xsl \
  json \
  mysqli \
  bcmath \
  zip


ENV PHP_MEMORY_LIMIT 2G
ENV PHP_PORT 9000
ENV PHP_PM dynamic
ENV PHP_PM_MAX_CHILDREN 10
ENV PHP_PM_START_SERVERS 4
ENV PHP_PM_MIN_SPARE_SERVERS 2
ENV PHP_PM_MAX_SPARE_SERVERS 6
ENV APP_MAGE_MODE default

RUN apt-get install -y git



EXPOSE 8001


