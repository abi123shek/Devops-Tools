#this shell script update system and install docker with giving permission to run docker containers

#!/bin/bash
sudo apt-get update
sudo apt-get install docker.io
sudo apt-get udpate
sudo groupadd docker
sudo usermod -aG  docker $USER
newgrp docker

#or we can use alternetes to docker container
sudo chmod 777 /var/run/docker.sock
