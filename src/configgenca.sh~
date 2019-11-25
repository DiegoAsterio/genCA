# Prepara un directorio
mkdir ca
touch ./ca/openssl.cnf
export CADIR=`pwd`
(envsubst '${CADIR}' < ./cnf/openssl_cnf/root_cnf/openssl.cnf) > ./ca/openssl.cnf
