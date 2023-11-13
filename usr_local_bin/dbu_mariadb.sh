#!/bin/bash

echo "Please enter root user MySQL password!"
echo "Note: password will be hidden when typing"
read -s rootpasswd
echo "Please enter the NAME of the new MySQL database! (example: database1)"
read dbname
echo "Please enter the MySQL database CHARACTER SET! (example: latin1, utf8, ...)"
echo "Enter utf8 if you don't know what you are doing"
read charset
echo "Creating new MySQL database..."
mariadb -uroot -p${rootpasswd} -e "CREATE DATABASE ${dbname} /*\!40100 DEFAULT CHARACTER SET ${charset} */;"
echo "Database successfully created!"
echo "Showing existing databases..."
mariadb -uroot -p${rootpasswd} -e "show databases;"
echo ""
echo "Please enter the NAME of the new MySQL database user! (example: user1)"
read username
echo "Please enter the PASSWORD for the new MySQL database user!"
echo "Note: password will be hidden when typing"
read -s userpass
echo "Creating new user..."
mariadb -uroot -p${rootpasswd} -e "CREATE USER ${username}@localhost IDENTIFIED BY '${userpass}';"
echo "User successfully created!"
echo ""
echo "Granting ALL privileges on ${dbname} to ${username}!"
mariadb -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'localhost';"
mariadb -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"
echo "You're good now :)"
exit
