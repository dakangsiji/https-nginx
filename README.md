## https-nginx

### Generate certificates

```
wget https://dl.eff.org/certbot-auto

chmod u+x certbot-auto

./certbot-auto certonly -d *.openeuler.org -d openeuler.org --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory

```

### Create a secret and a configmap

```
kubectl create secret generic websitesvcsecret \
--from-file=fullchain.pem \
--from-file=privkey.pem \
--from-file=chain.pem \
-n website
```
```
kubectl create configmap websitesvcconfigmap --from-file=default.conf -n website
```

```
kubectl create secret generic mailcertsecret \
--from-file=fullchain.pem \
--from-file=privkey.pem \
--from-file=chain.pem \
-n mail
```
