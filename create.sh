# Little script to setup self-signed certificates to test the Languagetool/NGINX stuff.

# TODO: Replace with other values!!!
CA_PASSWORD=TODO
LOCAL_PASSWORD=TODO

if [ $CA_PASSWORD = "TODO" ]
then
    echo "Change the CA_PASSWORD!"
    exit 1
fi

if [ $LOCAL_PASSWORD = "TODO" ]
then
    echo "Change the LOCAL_PASSWORD!"
    exit 1
fi

rm -rf cert
mkdir cert
cd cert || exit 1
mkdir CA
cd CA || exit 1
echo "1. Generate a CA certificate"
openssl genrsa -passout "pass:${CA_PASSWORD}" -out CA.key -des3 2048
echo "1b"
openssl req -x509 -sha256 -new -nodes -days 3650 -key CA.key -passin "pass:${CA_PASSWORD}" -out CA.pem -subj "/C=DE/ST=Bavaria/L=Munich/O=TUM/OU=TUM Infomatics/CN=test.de"
cd .. || exit 1
echo "Generating a certificate"
mkdir localhost
cd localhost || exit 1
echo "authorityKeyIdentifier = keyid,issuer" > localhost.ext
echo "basicConstraints = CA:FALSE" >> localhost.ext
echo "keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment" >> localhost.ext
echo "subjectAltName = @alt_names" >> localhost.ext

echo "[alt_names]" >> localhost.ext
echo "DNS.1 = localhost" >> localhost.ext
echo "IP.1 = 127.0.0.1" >> localhost.ext

openssl genrsa -passout "pass:${LOCAL_PASSWORD}" -out localhost.key -des3 2048 
echo "2b"
openssl req -new -key localhost.key -passin "pass:${LOCAL_PASSWORD}" -out localhost.csr -subj "/C=DE/ST=Bavaria/L=Munich/O=TUM/OU=TUM Infomatics/CN=localhost"
echo "2c"
openssl x509 -req -in localhost.csr -CA ../CA/CA.pem  -passin "pass:${CA_PASSWORD}" -CAkey ../CA/CA.key -CAcreateserial -days 3650 -sha256 -extfile localhost.ext -out localhost.crt
echo "2d"
openssl rsa -in localhost.key -passin "pass:${LOCAL_PASSWORD}" -out localhost.decrypted.key

cat localhost.decrypted.key > privkey.pem
cat localhost.crt > fullchain.pem
cat ../CA/CA.pem >> fullchain.pem
