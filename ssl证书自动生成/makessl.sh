#!/bin/bash
openssl req -new -sha256 -key /www/domain.key -subj "/" -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:${www}")) > domain.csr

python /home/xxx/www/ssl/acme_tiny.py --account-key /www/account.key --csr ./domain.csr --acme-dir /home/xxx/www/challenges/ > ./signed.crt
wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
cat signed.crt intermediate.pem > ${www}chained.pem
wget -O - https://letsencrypt.org/certs/isrgrootx1.pem > root.pem
cat intermediate.pem root.pem > full_chained.pem
mv * /www
echo "在www.caiwuhao.com上下载申请好的证书"