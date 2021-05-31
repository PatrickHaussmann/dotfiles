#!/bin/sh

# https://jekyllrb.com/docs/installation/ubuntu/


echo "Installing Jekyll"
sudo apt-get install -y ruby-full build-essential zlib1g-dev

echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

sudo gem install jekyll bundler github-pages
