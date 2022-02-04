#!/bin/sh

echo "Installing coder"

sh ufw.sh

curl -fsSL https://code-server.dev/install.sh | sh
sudo systemctl enable --now code-server@$USER

bash cloudflared.sh

