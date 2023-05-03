CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'afenzl'@'%' IDENTIFIED BY 'letmein';
-- UPDATE user SET plugin='mysql_native_password' WHERE User='afenzl';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';
GRANT ALL PRIVILEGES ON wordpress.* TO 'afenzl'@'%';
FLUSH PRIVILEGES; 