# gateone
Webshell

## Build Docker image
```shell
$ sudo docker build -t gateone:0.1 .
```

## Run Docker
```shell
$ sudo docker run -d --name test -p 8888:8000 gateone:0.1 gateone
```

## External Configuration
```shell
$sudo docker run -d \
-p 8888:8000\
-h gateone \
-v /opt/gateone/config:/etc/gateone/conf.d \
-v /opt/gateone/logs:/var/log/gateone/gateone.log \
-v /opt/gateone/users:/var/lib/gateone/users \
--name gateone \
gateone:0.1 gateone
```
