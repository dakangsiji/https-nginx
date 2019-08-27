## https-nginx

### Generate certificates

```
wget https://dl.eff.org/certbot-auto

chmod u+x certbot-auto

./certbot-auto certonly -d *.openeuler.org --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory

```

### Create a secret and a configmap
```
kubectl create secret tls openeulersvcsecret --key /tmp/openeulersvc.key --cert /tmp/openeulersvc.crt
```
```
kubectl create secret generic openeulersvcsecret \
--from-file=fullchain.pem \
--from-file=privkey.pem \
--from-file=chain.pem \
-n euler
```
```
kubectl create configmap openeulersvcconfigmap --from-file=default.conf -n euler
```
