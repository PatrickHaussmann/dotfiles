#!/bin/sh

echo "Installing coder"

bash node-v14.sh
bash yarn.sh

sudo npm install -g code-server --unsafe-perm
# Alternative:
# curl -fsSL https://code-server.dev/install.sh | sh
# sudo systemctl enable --now code-server@$USER

sudo mkdir /code
sudo chmod 777 /code
sudo chown $USER:$USER /code


sudo tee /lib/systemd/system/code-server.service << EOF
[Unit]
Description=Code Server Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/code-server --user-data-dir /code
Restart=always
StandardOutput=file:/var/log/code-server-output.log
StandardError=file:/var/log/code-server-error.log

[Install]
WantedBy=multi-user.target
EOF


sudo systemctl daemon-reload
sudo systemctl start code-server
sudo systemctl enable code-server

