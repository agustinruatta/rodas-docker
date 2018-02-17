# Get last stable Ubuntu
FROM ubuntu:xenial
MAINTAINER Agustín Ruatta <agustinruatta@gmail.com>

# Prevent dpkg complaining about not finding a suitable term
ENV DEBIAN_FRONTEND noninteractive

RUN apt update

#install utilities tools
RUN apt install -y vim nano unzip curl apt-transport-https \
    python-software-properties software-properties-common \
    supervisor locales

# Locales
RUN locale-gen en_US.UTF-8 es_AR.UTF-8 pt_BR.UTF-8 && export LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Add Ondrej PHP and Gearman repo (needs a UTF-8 locale)
RUN add-apt-repository -y ppa:ondrej/php && apt-get update

# Install nginx webserver
RUN apt-get install -y --force-yes nginx

# Install PHP Stack
RUN apt install -y php7.2 php7.2-apc php-console-table php-pear \
    php7.2-cgi php7.2-common php7.2-zip php7.2-fpm php7.2-cli \
    php7.2-pgsql php7.2-gmp php7.2-intl php7.2-json \
    php7.2-redis php7.2-sqlite php7.2-xdebug php7.2-oauth php7.2-curl \
    php7.2-mbstring

# Git depends on php, so if is installe before ondrej-repos this will install php5
RUN apt install -y git

# Install composer
RUN curl -O https://getcomposer.org/composer.phar && \
    mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

# Install phpunit
RUN cd /tmp && curl -LO https://phar.phpunit.de/phpunit-7.0.1.phar && \
    mv phpunit-7.0.1.phar /usr/local/bin/phpunit && \
    chmod +x /usr/local/bin/phpunit

# Create and remove necessary/unnecessary directories and files
RUN mkdir -p /var/run/php && \
    rm -f /etc/nginx/sites-enabled/default && \
    rm -f /etc/nginx/sites-available/default && \
    mkdir /var/log/rodas && \
    chmod -R 777 /var/log/rodas && \
    touch /var/log/rodas.error.log && \
    chmod 777 /var/log/rodas.error.log && \
    mkdir /tmp/sqlite-memory && \
    chmod -R 777 /tmp/sqlite-memory

# Add nginx config, fpm and supervisor configs
ADD ./nginx-fpm-php/nginx/nginx.conf /etc/nginx/
ADD ./nginx-fpm-php/nginx/rodas.conf.default /etc/nginx/sites-enabled/rodas.conf
ADD ./nginx-fpm-php/nginx/rodas.conf.default /etc/nginx/sites-available/
ADD ./nginx-fpm-php/fpm/www.conf /etc/php/7.2/fpm/pool.d/www.conf
ADD ./nginx-fpm-php/fpm/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf

# Add supervisor config
ADD ./nginx-fpm-php/supervisor/supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN phpenmod mcrypt

# PHP XDebug config
RUN echo "xdebug.idekey="phpstorm"" >> /etc/php/7.2/mods-available/xdebug.ini && \
    echo "xdebug.remote_enable=1" >> /etc/php/7.2/mods-available/xdebug.ini && \
    echo "xdebug.remote_connect_back=1" >> /etc/php/7.2/mods-available/xdebug.ini && \
    echo "xdebug.remote_port=9000" >> /etc/php/7.2/mods-available/xdebug.ini && \
    echo "xdebug.max_nesting_level=600" >> /etc/php/7.2/mods-available/xdebug.ini && \
    echo "xdebug.scream=0" >> /etc/php/7.2/mods-available/xdebug.ini && \
    echo "xdebug.cli_color=1" >> /etc/php/7.2/mods-available/xdebug.ini && \
    echo "xdebug.show_local_vars=1" >> /etc/php/7.2/mods-available/xdebug.ini

############################################################################
##
## FRONTEND DEPS
##
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" |  tee /etc/apt/sources.list.d/yarn.list && \
    curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
    apt update && apt install -y nodejs yarn

# Workdir
WORKDIR /var/www