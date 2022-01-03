# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "private_network", ip: "192.168.47.62"
  config.vm.hostname = "vagrant"

  config.vm.provision "shell", inline: <<-SHELL
     [ -d dotfiles ] && exit 0
     ln -s /vagrant/ /home/patrick
     sudo -u vagrant cp /home/patrick/.ssh/* .ssh/
     sudo -u vagrant git clone --quiet git@github.com:PatrickHaussmann/dotfiles.git
     cd dotfiles
     sudo -u vagrant bash install.sh
     cd ..
     rm .ssh/*.orig
   SHELL
end
