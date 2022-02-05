#!/bin/sh

echo "Installing coder"

sh ufw.sh

curl -fsSL https://code-server.dev/install.sh | sh
# Alternative:
# bash nodejs.sh
# sudo npm install -g code-server
# or
# bash yarn.sh
# sudo yarn global add code-server

sudo systemctl enable --now code-server@$USER

bash cloudflared.sh

