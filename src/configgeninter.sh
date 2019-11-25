#!/bin/bash
# Prepara un directorio
mkdir ./ca/intermediate
touch ./ca/intermediate/openssl.cnf
export CADIR=`pwd`
(envsubst '${CADIR}' < ./cnf/openssl_cnf/intermediate_cnf/openssl.cnf) > ./ca/intermediate/openssl.cnf
