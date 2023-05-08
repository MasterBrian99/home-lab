#!/bin/bash

curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sudo systemctl enable docker

# add user to docker group

USERNAME=brian

groupadd docker
usermod -aG docker "${USERNAME}"