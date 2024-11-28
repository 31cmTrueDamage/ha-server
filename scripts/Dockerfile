FROM ubuntu:latest

# Set the non-interactive frontend to suppress debconf warnings
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Lisbon

# Set the timezone and install necessary packages
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    apt update && \
    apt install -yq \
        rrdtool \
        apache2 \
        mariadb-client \
        php \
        php-mysql \
		php-mysqli \
        php-gd \
        php-gmp \
        php-intl \
        php-ldap \
        php-mbstring \
        php-simplexml \
        php-xml \
        php-snmp \
        wget \
        cron && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory for Cacti
WORKDIR /var/www/html/

# Download and install Cacti (version 1.2.28)
RUN wget https://files.cacti.net/cacti/linux/cacti-1.2.28.tar.gz && \
    tar xzvf cacti-1.2.28.tar.gz && \
    mv cacti-1.2.28 cacti && \
    rm cacti-1.2.28.tar.gz

# Configure PHP timezone (assuming PHP version directory structure matches)
RUN if [ -f /etc/php/8.3/apache2/php.ini ]; then \
        sed -i 's/;date.timezone =/date.timezone = Europe\/Lisbon/' /etc/php/8.3/apache2/php.ini && \
        sed -i 's/;date.timezone =/date.timezone = Europe\/Lisbon/' /etc/php/8.3/cli/php.ini; \
    fi

# Copy the custom config.php file (ensure you provide this file in the build context)
COPY config.php /var/www/html/cacti/include/config.php

# Set permissions for Cacti files
RUN chown -R www-data:www-data /var/www/html/cacti && \
    chmod -R 755 /var/www/html/cacti

# Add cron job for Cacti poller
RUN echo "*/5 * * * * www-data php /var/www/html/cacti/poller.php > /dev/null 2>&1" >> /etc/crontab

# Expose port 80 for Apache
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
