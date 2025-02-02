#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget
wget https://github.com/aquasecurity/trivy/releases/download/v0.29.1/trivy_0.29.1_Linux-64bit.deb
sudo dpkg -i trivy_0.29.1_Linux-64bit.deb
trivy --version
echo "downloaded Sucessfully"

