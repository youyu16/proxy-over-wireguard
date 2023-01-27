# proxy-over-wireguard
Squid Http Proxy Over Wireguard based on linuxserver/wireguard image

## Run Container

### Docker command

```
docker run -d --name proxy-over-wireguard \
 --cap-add NET_ADMIN 
 --network bridge \
 -e PUID=1000 \
 -e PGID=1000 \
 -e TZ=Asia/Shanghai \
 -v /your/wireguard_config/path:/config \
 -v /your/squid_config/path:/etc/squid \
 -p 3128:3128 \
 --restart unless-stopped \
 proxy-over-wg:latest
```

### Docker compose

```
version: "2.1"
services:
  wireguard:
    image: proxy-over-wireguard
    container_name: proxy-over-wireguard
    cap_add:
      - NET_ADMIN
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Asia/Shanghai
      - SERVERURL= #optional
      - SERVERPORT= #optional
      - INTERNAL_SUBNET=10.13.13.0 #optional
      - PEERDNS=auto
    volumes:
      - /your/wireguard_config/path:/config
      - /your/squid_config/path:/etc/squid
    ports:
      - 3128:3128
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
    restart: unless-stopped
```