
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'afenzl'@'%' IDENTIFIED BY 'letmein';
GRANT ALL PRIVILEGES ON wordpress.* TO 'afenzl'@'%';
FLUSH PRIVILEGES; 
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';