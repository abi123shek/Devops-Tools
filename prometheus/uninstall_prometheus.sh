#!/bin/bash

# Script to uninstall Prometheus from Ubuntu
set -e  # Exit immediately if a command exits with a non-zero status

echo "Stopping Prometheus service..."
sudo systemctl stop prometheus || true

echo "Disabling Prometheus service..."
sudo systemctl disable prometheus || true

echo "Removing Prometheus binaries and directories..."
sudo rm -rf /usr/local/bin/prometheus
sudo rm -rf /usr/local/bin/promtool
sudo rm -rf /etc/prometheus
sudo rm -rf /var/lib/prometheus
sudo rm -rf /etc/systemd/system/prometheus.service

echo "Removing Prometheus user..."
sudo userdel -r prometheus || true

echo "Removing Prometheus systemd service..."
sudo systemctl daemon-reload

echo "Prometheus uninstallation complete!"
echo "----------------------------------------"
