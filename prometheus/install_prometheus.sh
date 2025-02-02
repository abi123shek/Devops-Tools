#!/bin/bash

# Script to install Prometheus on Ubuntu
set -e  # Exit immediately if a command exits with a non-zero status

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Prometheus
echo "Creating Prometheus user..."
sudo useradd --no-create-home --shell /bin/false prometheus

echo "Creating Prometheus directories..."
sudo mkdir -p /etc/prometheus /var/lib/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

PROM_VERSION="2.51.2"  # Change this if a newer version is available
echo "Downloading Prometheus v$PROM_VERSION..."
cd /tmp
curl -LO https://github.com/prometheus/prometheus/releases/download/v$PROM_VERSION/prometheus-$PROM_VERSION.linux-amd64.tar.gz

echo "Extracting Prometheus..."
tar xvf prometheus-$PROM_VERSION.linux-amd64.tar.gz
cd prometheus-$PROM_VERSION.linux-amd64

echo "Moving Prometheus binaries..."
sudo mv prometheus promtool /usr/local/bin/

echo "Setting up Prometheus config..."
sudo mv consoles console_libraries /etc/prometheus/
sudo mv prometheus.yml /etc/prometheus/
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus

echo "Creating Prometheus systemd service..."
cat <<EOF | sudo tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
    --config.file=/etc/prometheus/prometheus.yml \\
    --storage.tsdb.path=/var/lib/prometheus/ \\
    --web.console.templates=/etc/prometheus/consoles \\
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF

echo "Starting Prometheus service..."
sudo systemctl daemon-reload
sudo systemctl enable --now prometheus

echo "Prometheus installation complete!"
echo "----------------------------------------"
echo "Prometheus UI: http://localhost:9090"
echo "----------------------------------------"
