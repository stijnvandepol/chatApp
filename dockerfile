# Gebruik een officiële PHP + Apache-image als basis
FROM php:7.4-apache

# Installeer mysqli-extensie
RUN docker-php-ext-install mysqli

# Kopieer de PHP-bestanden naar de juiste locatie in de container
COPY src/ /var/www/html/

# Kopieer het init-db.sh script naar de container
COPY init-db.sh /usr/local/bin/

# Maak het script uitvoerbaar en voer het uit bij het opstarten van de container
RUN chmod +x /usr/local/bin/init-db.sh
CMD ["/usr/local/bin/init-db.sh"]

# Expose de poort waarop de webserver draait
EXPOSE 80

# Start de Apache-webserver wanneer de container wordt gestart
CMD ["apache2-foreground"]
