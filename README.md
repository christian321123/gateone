# gateone
Webshell

## Build Docker image
```shell
$ sudo docker build -t gateone .
```

## Run Docker
```shell
$ sudo docker run -d --name test -p 443:8000 test gateone
```

## External Configuration
```shell
$sudo docker run -d \
-p 10020:9999\
-h gateone \
-v /opt/gateone/config:/etc/gateone/conf.d \
-v /opt/gateone/logs:/var/log/gateone/gateone.log \
-v /opt/gateone/users:/var/lib/gateone/users \
--name gateone \
liftoff/gateone gateone
```
