#!/bin/bash

while IFS= read -d '' -r line; do export "$line";  done < /proc/1/environ
mkdir -p /root/.ssh
echo $SSH_KEY > /root/.ssh/authorized_keys
