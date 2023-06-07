#!bin/bash

# setting up ssl Certificate
echo "setting up ssl"
openssl req -x509 -nodes -days 356 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj /C=DE/ST=Heilbronn/L=Heilbronn/O=wordpress/CN=$DOMAIN
echo "ssl is set up!"

exec "$@"

# req": Creates a new X.509 certificate request.
# "-x509": Generates a self-signed SSL certificate instead of a certificate request.
# "-nodes": Tells OpenSSL to create a private key without encrypting it with a passphrase.
# "-days 365": Sets the expiration time of the certificate to 365 days.
# "-newkey rsa:4096": Generates a new RSA private key with a length of 4096 bits.
# "-keyout /etc/ssl/private/nginx.key": Sets the path and filename for the private key file.
# "-out /etc/ssl/certs/nginx.crt": Sets the path and filename for the certificate file.
# "-subj "/C=RU/ST=Moscow/L=Moscow/O=wordpress/CN=afenzl.42.fr"": Sets the subject field of the certificate with the specified values.