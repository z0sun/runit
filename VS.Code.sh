#!/bin/bash

# Install code-server
curl -fsSL https://code-server.dev/install.sh | sh

# Enable code-server service
sudo systemctl enable --now code-server@$USER

# Wait for the service to start
sleep 1

# Configure code-server
CONFIG_PATH="$HOME/.config/code-server/config.yaml"
echo "bind-addr: 0.0.0.0:8081
auth: password
password: abcd1234
cert: false" > "$CONFIG_PATH"

# Restart code-server service to apply configuration changes
sudo systemctl restart code-server@$USER
