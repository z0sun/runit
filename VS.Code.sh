#!/bin/bash

# Install code-server
curl -fsSL https://code-server.dev/install.sh | sh

# Check for systemctl command and enable code-server service
if command -v systemctl &> /dev/null; then
    sudo systemctl enable --now code-server@$USER
    # Wait for the service to start
    sleep 1
    sudo systemctl restart code-server@$USER
else
    echo "systemctl is not available. Cannot enable or restart code-server service."
fi

# Configure code-server
CONFIG_PATH="$HOME/.config/code-server/config.yaml"
echo "bind-addr: 0.0.0.0:8081
auth: password
password: abcd1234
cert: false" > "$CONFIG_PATH"
