## https-nginx

### Generate certificates

```
make key
```
OR
```
make key KEY=/tmp/openeulersvc.key CERT=/tmp/openeulersvc.crt
```

### Create a secret and a configmap
```
kubectl create secret tls openeulersvcsecret --key /tmp/openeulersvc.key --cert /tmp/openeulersvc.crt
```
```
kubectl create configmap openeulersvcconfigmap --from-file=default.conf
```

### Create a service and a replication controller

```
kubectl create -f nginxapp.yaml
```

### Visit website

```
curl https://<your-node-ip>:<your-port> -k
```

### Change default from index.html to index2.html

```
kubectl create configmap openeulersvcconfigmap --from-file=default.conf -o yaml --dry-run\
| sed 's/index.html/index2.html/g' | kubectl apply -f -
```
