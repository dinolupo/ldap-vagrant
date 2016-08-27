# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/trusty64"

	config.landrush.enabled = true
	config.landrush.tld = 'dev'
	config.vm.hostname = "ldap.vagrant.dev"

	#config.vm.network "private_network", ip: "192.168.33.253"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "shell", path: "phpldapadmin.sh"
end
