FROM ubuntu:latest

LABEL org.opencontainers.image.authors="archit3kt <hitekchallenger@ŋmail.com>"
LABEL org.opencontainers.image.created="2022-04-21"
LABEL org.opencontainers.image.source="https://github.com/archit3kt/3f_flists/tree/main/k3s_1.21.8"
LABEL version="1.0"

RUN apt-get update ; \
    apt-get upgrade --no-install-recommends -y ; \
    apt-get install --no-install-recommends -y openssh-server wget ca-certificates iptables ebtables iproute2 nano vim ipset conntrack ; \
    mkdir -p /opt/k3s /etc/zinit ; \
    cd /opt/k3s ; \
    wget --no-check-certificate https://github.com/k3s-io/k3s/releases/download/v1.22.8%2Bk3s1/k3s

COPY entrypoint.sh /
COPY zinit /sbin
COPY init.yaml /etc/zinit

RUN chmod 700 /entrypoint.sh /opt/k3s/k3s /sbin/zinit

ENTRYPOINT ["/sbin/zinit", "init"]
