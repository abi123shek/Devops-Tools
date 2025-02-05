# Install Jenkins For Master

* Update the System 
``` sudo apt-get update ```

* Downlaod Jenkins Master

```bash
 sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null 
```
* Update the System 
```bash sudo apt-get update ```
* Install Jenkins 
```bash sudo apt-get install jenkins ```

# Install Java Package in master 

without java Jenkins could not run

# Installing java run time to run jenkins server

* Update the System 
``` sudo apt update ```
* Install openjdk
``` sudo apt install fontconfig openjdk-17-jre ```
* Check Java Version
``` java -version ```
* Check openjdk Version
``` openjdk version "17.0.13" 2024-10-15 ```
* RunTime Environment
``` OpenJDK Runtime Environment (build 17.0.13+11-Debian-2) ```
* Openjdk Server
``` OpenJDK 64-Bit Server VM (build 17.0.13+11-Debian-2, mixed mode, sharing) ```


# Install Jenkins For Node (Agent)
in agent or node we only need to install java and openjdk

# Installing java run time to run jenkins server

* Update the System 
``` sudo apt update ```
* Install openjdk
``` sudo apt install fontconfig openjdk-17-jre ```
* Check Java Version
``` java -version ```
* Check openjdk Version
``` openjdk version "17.0.13" 2024-10-15 ```
* RunTime Environment
``` OpenJDK Runtime Environment (build 17.0.13+11-Debian-2) ```
* Openjdk Server
``` OpenJDK 64-Bit Server VM (build 17.0.13+11-Debian-2, mixed mode, sharing) ```



