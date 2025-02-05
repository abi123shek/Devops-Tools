# How To Install Docker  with Steps (in Linux)

* 1. Update System
```bash  sudo apt-get update```

* 2. Install docker
```bash sudo apt-get install docker.io ```

* 3. Update System Again (to make sure that docker package is installed properly or not)
```bash sudo apt-get udpate ```
* 4. Add User In Docker Group
```bash sudo groupadd docker ```
```bash sudo usermod -aG  docker $USER ```
* 5. Refresh the user group
```bash newgrp docker```

# or we can use alternetes to docker container
```` sudo chmod 777 /var/run/docker.sock ````
