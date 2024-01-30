sudo apt-get update -y
#insntalla mysql
sudo apt-get install mysql-server -y
#abilito connessioni da parte di altri server
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

sudo service mysql restart

#dichiarazione variabili database
MYSQL_DATABASE="miodatabase"

sudo mysql -e "CREATE USER 'admin'@'10.10.20.10' IDENTIFIED BY 'Password&1';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'10.10.20.10';"

#crazione database
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"