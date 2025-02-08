
# Step 1: Install SonarQube on Ubuntu
SonarQube requires PostgreSQL as its database.

## 1.1 Install PostgreSQL

``` sudo apt update ```
```sudo apt install -y postgresql postgresql-contrib ```
Start and enable PostgreSQL
``` sudo systemctl enable --now postgresql ```
Create a SonarQube database and user
```sudo -i -u postgres psql ```
Run the following PostgreSQL commands
```
 CREATE DATABASE sonarqube;
CREATE USER sonar WITH ENCRYPTED PASSWORD 'sonar';
GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonar;
\q
```
## 1.2 Install SonarQube
Download and extract SonarQube
```
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.3.79811.zip
sudo apt install -y unzip
unzip sonarqube-9.9.3.79811.zip
sudo mv sonarqube-9.9.3.79811 /opt/sonarqube
```
 Create a SonarQube user
```
sudo useradd -r -M -d /opt/sonarqube -s /bin/bash sonar
sudo chown -R sonar:sonar /opt/sonarqube

```
Configure SonarQube
```
sudo nano /opt/sonarqube/conf/sonar.properties
```
 Modify these lines
```
sonar.jdbc.username=sonar
sonar.jdbc.password=sonar
sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube

```
change and exit

## 1.3 Create a Systemd Service for SonarQube
Create a new service file

```
sudo nano /etc/systemd/system/sonarqube.service
```
Add the following content

```
[Unit]
Description=SonarQube Service
After=network.target

[Service]
Type=simple
User=sonar
Group=sonar
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
Restart=always

[Install]
WantedBy=multi-user.target

```
save and exit

Reload systemd and start SonarQube

```
sudo systemctl daemon-reload
sudo systemctl enable --now sonarqube

```

## 1.4 Access SonarQube
Check if SonarQube is running
```
sudo systemctl status sonarqube

```
If running, open http://localhost:9000 in your browser.

Default username: admin
Default password: admin
Change the password after the first login.



