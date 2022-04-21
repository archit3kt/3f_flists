Originating from Ubuntu container latest 20.04 LTS at date (21th of April 2022) ; Systemd installation commands from Robert Debock (https://github.com/robertdebock/docker-ubuntu-systemd)

sshKeysCopy is a bash script parsing container's env variables from /proc/1/environ to get the SSH_KEY passed in parameters by user when launching container, and copying it to /root/.ssh/authorized_keys

SSH and sshKeysCopy are systemd services enabled to execute at container run time

Warning : This is for test only, containers are not supposed to run systemd ! Use at your own risks !

# Building
`docker build -t archit3kt/ubuntu-systemd:20.04 .`

## Running

```docker run -d --privileged --env SSH_KEY='your SSH key' archit3kt/ubuntu-systemd:20.04
```

## Flist
https://hub.grid.tf/archit3kt.3bot/archit3kt-ubuntu-systemd-20.04.flist

## entrypoint 

```
/lib/systemd/systemd
```

