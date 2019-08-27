## https-nginx

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
