all:

TAG = 1.0
PREFIX = openeuler/website
KEY = /tmp/openeulersvc.key
CERT = /tmp/openeulersvc.crt

keys:
	# The CName used here is specific to the service specified in nginx-app.yaml.
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $(KEY) -out $(CERT) -subj "/CN=openeulersvc/O=openeulersvc"

docker:
	docker build --pull -t $(PREFIX):$(TAG) .

clean:
	rm -rf $(KEY)
	rm -rf $(CERT)
