#!/bin/bash

cd ./ca
mkdir certs crl newcerts  private
chmod 700 private
touch index.txt
echo 1000 > serial
echo "Set a pass for the root authority:"
openssl genrsa -aes256 -out private/ca.key.pem 4096
chmod 400 private/ca.key.pem
openssl req -config openssl.cnf \
	-key private/ca.key.pem \
	-new -x509 -days 7300 \
	-sha256 -extensions v3_ca \
	-out certs/ca.cert.pem
chmod 444 ./certs/ca.cert.pem
# ISSUE: Preparar comprobacion de Issuer==Subject X509v3
openssl x509 -noout -text -in certs/ca.cert.pem

