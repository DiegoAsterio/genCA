#!/bin/bash
cd ./ca
# creates key using pass phrase
openssl genrsa -aes256 \
	-out intermediate/private/$1.key.pem 2048
chmod 400 intermediate/private/$1.key.pem
# creates certificate signature
openssl req -config intermediate/openssl.cnf \
	-key intermediate/private/$1.key.pem \
	-new -sha256 -out intermediate/csr/$1.csr.pem
openssl ca -config intermediate/openssl.cnf \
	-extensions server_cert -days 375 -notext \
	-md sha256 -in intermediate/csr/$1.csr.pem \
	-out intermediate/certs/$1.cert.pem \
	-subj "/CN=$1"
chmod 444 intermediate/certs/$1.cert.pem
openssl x509 -noout -text \
	-in intermediate/certs/$1.cert.pem
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem \
	intermediate/certs/$1.cert.pem
