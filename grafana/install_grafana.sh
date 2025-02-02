#!/bin/bash

# Script to install Grafana on Ubuntu
set -e  # Exit immediately if a command exits with a non-zero status

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Add Grafana repository
echo "Adding Grafana repository..."
sudo apt install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo wget -q -O - https://packages.grafana.com/gpg.key | sudo tee /etc/apt/trusted.gpg.d/grafana.asc

# Install Grafana
echo "Installing Grafana..."
sudo apt update
sudo apt install -y grafana

# Start and enable Grafana service
echo "Starting Grafana service..."
sudo systemctl enable --now grafana-server

echo "Grafana installation complete!"
echo "----------------------------------------"
echo "Grafana UI: http://localhost:3000 (Login: admin / admin)"
echo "----------------------------------------"
