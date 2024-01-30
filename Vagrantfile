# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  BOX_IMAGE = "ubuntu/jammy64"
  BOX_WEB_NAME = "m340_web"
  BOX_DB_NAME = "m340_db"
  PROXY_URL = "http://10.20.5.51:8888"
  NO_PROXY = "localhost,127.0.0.1"
  BASE_INT_NETWORK = "10.10.20"
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  
  PROXY_ENABLE = true

# WEB
  config.vm.define "web" do |webconfig|
  
	webconfig.ssh.insert_key = false
	webconfig.vm.box_check_update = false
  
    webconfig.vm.box = BOX_IMAGE
	
	if Vagrant.has_plugin?("vagrant-proxyconf")
		if PROXY_ENABLE == true
			webconfig.proxy.http = PROXY_URL
			webconfig.proxy.https = PROXY_URL
			webconfig.proxy.no_proxy = NO_PROXY
		end
	end

    webconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.10", virtualbox__intnet: true
	webconfig.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10"
	
	webconfig.vm.provision "shell", path: "./scripts/web.sh"
	
	webconfig.vm.synced_folder "html/", "/var/www/html"
	
	webconfig.vm.provider "virtualbox" do |vb|
	  vb.name = BOX_WEB_NAME
	  vb.memory = "4096"
	end
	
  end

# DB
  config.vm.define "db" do |dbconfig|
  
	dbconfig.ssh.insert_key = false
	dbconfig.vm.box_check_update = false
  
    dbconfig.vm.box = BOX_IMAGE
	
	if Vagrant.has_plugin?("vagrant-proxyconf")
		if PROXY_ENABLE == true
			dbconfig.proxy.http = PROXY_URL
			dbconfig.proxy.https = PROXY_URL
			dbconfig.proxy.no_proxy = NO_PROXY
		end
	end
	
	dbconfig.vm.network "private_network", ip: "#{BASE_INT_NETWORK}.11", virtualbox__intnet: true
	#usare solo per DEBUG DB
	#dbconfig.vm.network "public_network", ip: "#{BASE_HOST_ONLY_NETWORK}.11"
	
	dbconfig.vm.provision "shell", path: "./scripts/db.sh"
	
	dbconfig.vm.provider "virtualbox" do |vb|
	  vb.name = BOX_DB_NAME
	  vb.memory = "4096"
	end
	
  end
  
end
