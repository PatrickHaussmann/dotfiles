#!/bin/sh

echo "Installing extraterm"

tmp_dir=$(mktemp -d)
wget "https://github.com/sedwards2009/extraterm/releases/download/v0.59.4/extraterm_0.59.4_amd64.deb" -O $tmp_dir/extraterm_amd64.deb
sudo apt-get -y install $tmp_dir/extraterm_amd64.deb
rm -rf $tmp_dir


cat <<EOF > ~/.config/extraterm/extraterm.json
{
  "autoCopySelectionToClipboard": true,
  "blinkingCursor": false,
  "cursorStyle": "beam",
  "frameByDefault": true,
  "frameRule": "frame_if_lines",
  "frameRuleLines": 10,
  "gpuDriverWorkaround": "none",
  "isHardwareAccelerated": true,
  "keybindingsName": "pc-style",
  "minimizeToTray": false,
  "scrollbackMaxFrames": 100,
  "scrollbackMaxLines": 500000,
  "showTips": "never",
  "showTrayIcon": false,
  "terminalFont": "LigaDejaVuSansMono",
  "terminalFontSize": 14,
  "terminalDisplayLigatures": false,
  "terminalMarginStyle": "normal",
  "tipCounter": 12,
  "tipTimestamp": 1650571295918,
  "titleBarStyle": "compact",
  "uiScalePercent": 100,
  "windowBackgroundMode": "opaque",
  "windowBackgroundTransparencyPercent": 50,
  "closeWindowWhenEmpty": true,
  "middleMouseButtonAction": "paste",
  "middleMouseButtonShiftAction": "paste",
  "middleMouseButtonControlAction": "paste",
  "rightMouseButtonAction": "context_menu",
  "rightMouseButtonShiftAction": "context_menu",
  "rightMouseButtonControlAction": "context_menu",
  "activeExtensions": {},
  "themeTerminal": "itermcolors-terminal-theme-provider:Two Dark.itermcolors",
  "themeSyntax": "textmate-syntax-theme-provider:Dracula.tmTheme",
  "themeGUI": "two-dark-ui",
  "windowConfiguration": {
    "0": {
      "isMaximized": true,
      "x": 410,
      "y": 152,
      "width": 1200,
      "height": 600
    }
  },
  "commandLineActions": [
    {
      "frameRule": "never_frame",
      "frameRuleLines": 5,
      "match": "show",
      "matchType": "name"
    }
  ],
  "sessions": [
    {
      "uuid": "26547f10-44f3-4979-a715-779b8194b210",
      "name": "Default shell",
      "type": "unix",
      "useDefaultShell": true,
      "shell": "",
      "initialDirectory": "",
      "extensions": {
        "terminal-title:title": {
          "template": "${icon:fas fa-keyboard} ${term:title}"
        }
      },
      "args": ""
    }
  ]
}
EOF
