#!/bin/bash
# Wacht tot MySQL is gestart
while ! mysqladmin ping -h"db" --silent; do
    sleep 1
done

# Voer de SQL-query uit
mysql -h"db" -u"user" -p"Rookworst31!" -e "CREATE TABLE IF NOT EXISTS chatbase (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
"