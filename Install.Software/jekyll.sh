#!/bin/sh

# https://jekyllrb.com/docs/installation/ubuntu/


echo "Installing Jekyll"
sudo apt-get install -y ruby-full build-essential zlib1g-dev


mkdir -p ~/.bash.d

cat <<EOF > ~/.bash.d/jekyll.bash
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
EOF

source ~/.bashrc

sudo gem install jekyll bundler github-pages

