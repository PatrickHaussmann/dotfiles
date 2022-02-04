#!/bin/sh

echo "Installing coder"

sh ufw.sh
sudo ufw allow ssh
sudo ufw allow https

curl -fsSL https://code-server.dev/install.sh | sh
sudo systemctl enable --now code-server@$USER

bash caddy.sh

sudo tee /etc/caddy/Caddyfile << EOF
code.5ls.de

reverse_proxy 127.0.0.1:8080
EOF

sudo systemctl reload caddy

