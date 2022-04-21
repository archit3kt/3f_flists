FROM ubuntu:20.04

LABEL org.opencontainers.image.authors="archit3kt <fabrice.verbrouck@gmail.com>"
LABEL org.opencontainers.image.created="2022-04-21"
LABEL org.opencontainers.image.source="https://github.com/archit3kt/3f_flists/tree/main/ubuntu-systemd_20.04"
LABEL org.opencontainers.origin.name="robertdebock/ubuntu"
LABEL version="1.0"

COPY sshKeys.service /lib/systemd/system
COPY sshKeysCopy.sh /sbin

# Enable systemd.
RUN apt-get update && apt-get upgrade --no-install-recommends ; \
    apt-get install -y --no-install-recommends systemd systemd-sysv openssh-server nano; \
    apt-get clean ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
    cd /lib/systemd/system/sysinit.target.wants/ ; \
    ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 ; \
    rm -f /lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /lib/systemd/system/basic.target.wants/* ; \
    rm -f /lib/systemd/system/anaconda.target.wants/* ; \
    rm -f /lib/systemd/system/plymouth* ; \
    rm -f /lib/systemd/system/systemd-update-utmp* ; \
    systemctl enable ssh ; \
    systemctl enable sshKeys ;

ENTRYPOINT ["/lib/systemd/systemd"]
