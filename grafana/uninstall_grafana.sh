#!/bin/bash

# Script to uninstall Grafana from Ubuntu
set -e  # Exit immediately if a command exits with a non-zero status

echo "Stopping Grafana service..."
sudo systemctl stop grafana-server || true

echo "Disabling Grafana service..."
sudo systemctl disable grafana-server || true

echo "Uninstalling Grafana..."
sudo apt remove --purge -y grafana
sudo apt autoremove -y
sudo rm -rf /var/lib/grafana
sudo rm -rf /etc/grafana
sudo rm -rf /usr/share/grafana

echo "Reloading systemd..."
sudo systemctl daemon-reexec

echo "Grafana uninstallation complete!"
echo "----------------------------------------"
