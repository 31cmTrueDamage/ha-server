Vagrant.configure("2") do |config|

	shared_folder = "./scripts"

	config.vm.define "web1" do |web1|
		
		web1.vm.box = "ubuntu/jammy64"
		web1.vm.network "private_network", ip: "192.168.30.121"
		web1.vm.provider "virtualbox" do |vb|
			vb.name = "web1"
			vb.memory = 2048
			vb.cpus = 4
		end
		web1.vm.hostname = "web1"
		web1.vm.synced_folder shared_folder, "/vagrant"
		
		web1.vm.disk :disk, size: "3GB", name: "sdc"
		web1.vm.disk :disk, size: "3GB", name: "sdd"
		
		web1.vm.provision "shell", inline: <<-SHELL
			chmod +x /vagrant/*.sh
			bash /vagrant/setup.sh
			bash /vagrant/raid.sh
			bash /vagrant/install_gluster.sh
			bash /vagrant/web_setup.sh
			bash /vagrant/ganglia_setup.sh
			sudo reboot
		SHELL
		
	end
	
	config.vm.define "web2" do |web2|
	web2.vm.box = "ubuntu/jammy64"

		web2.vm.network "private_network", ip: "192.168.30.122"
		web2.vm.provider "virtualbox" do |vb|
			vb.name = "web2"
			vb.memory = 2048
			vb.cpus = 4
		end
		web2.vm.hostname = "web2"
		web2.vm.synced_folder shared_folder, "/vagrant"
		
		web2.vm.disk :disk, size: "3GB", name: "sdc"
		web2.vm.disk :disk, size: "3GB", name: "sdd"
		
		web2.vm.provision "shell", inline: <<-SHELL
			chmod +x /vagrant/*.sh
			bash /vagrant/setup.sh
			bash /vagrant/raid.sh
			bash /vagrant/install_gluster.sh
			bash /vagrant/web_setup.sh
			bash /vagrant/ganglia_setup.sh
			sudo reboot
		SHELL
		
	end
	
	config.vm.define "sql1" do |sql1|
	sql1.vm.box = "ubuntu/jammy64"

		sql1.vm.network "private_network", ip: "192.168.30.111"
		sql1.vm.provider "virtualbox" do |vb|
			vb.name = "sql1"
			vb.memory = 2048
			vb.cpus = 1
		end
		sql1.vm.hostname = "sql1"
		sql1.vm.synced_folder shared_folder, "/vagrant"
		
		sql1.vm.disk :disk, size: "3GB", name: "sdc"
		sql1.vm.disk :disk, size: "3GB", name: "sdd"
		
		sql1.vm.provision "shell", inline: <<-SHELL
			chmod +x /vagrant/*.sh
			bash /vagrant/setup.sh
			bash /vagrant/raid.sh
			bash /vagrant/install_gluster.sh
			bash /vagrant/mariadb_setup.sh
			bash /vagrant/ganglia_setup.sh
			sudo reboot
		SHELL
		
	end
	
	config.vm.define "sql2" do |sql2|
	sql2.vm.box = "ubuntu/jammy64"

		sql2.vm.network "private_network", ip: "192.168.30.112"
		sql2.vm.provider "virtualbox" do |vb|
			vb.name = "sql2"
			vb.memory = 2048
			vb.cpus = 1
		end
		sql2.vm.hostname = "sql2"
		sql2.vm.synced_folder shared_folder, "/vagrant"
		
		sql2.vm.disk :disk, size: "3GB", name: "sdc"
		sql2.vm.disk :disk, size: "3GB", name: "sdd"
		
		sql2.vm.provision "shell", inline: <<-SHELL
			chmod +x /vagrant/*.sh
			bash /vagrant/setup.sh
			bash /vagrant/raid.sh
			bash /vagrant/install_gluster.sh
			bash /vagrant/mariadb_setup.sh
			bash /vagrant/ganglia_setup.sh
			sudo reboot
		SHELL
		
	end
	
	config.vm.define "haproxy1" do |haproxy1|
	haproxy1.vm.box = "ubuntu/jammy64"
		
		haproxy1.vm.network "private_network", ip: "172.20.30.200"
		haproxy1.vm.network "private_network", ip: "192.168.30.100"
		haproxy1.vm.provider "virtualbox" do |vb|
			vb.name = "haproxy1"
			vb.memory = 2048
			vb.cpus = 1
		end
		haproxy1.vm.hostname = "haproxy1"
		haproxy1.vm.synced_folder shared_folder, "/vagrant"
		
		haproxy1.vm.provision "shell", inline: <<-SHELL
			chmod +x /vagrant/*.sh
			bash /vagrant/setup.sh
			bash /vagrant/haproxy_setup.sh
			sudo reboot
		SHELL
		
	end
	
	config.vm.define "haproxy2" do |haproxy2|
	haproxy2.vm.box = "ubuntu/jammy64"
		
		haproxy2.vm.network "private_network", ip: "172.20.30.201"
		haproxy2.vm.network "private_network", ip: "192.168.30.101"
		haproxy2.vm.provider "virtualbox" do |vb|
			vb.name = "haproxy2"
			vb.memory = 2048
			vb.cpus = 1
		end
		haproxy2.vm.hostname = "haproxy2"
		haproxy2.vm.synced_folder shared_folder, "/vagrant"
		
		haproxy2.vm.provision "shell", inline: <<-SHELL
			chmod +x /vagrant/*.sh
			bash /vagrant/setup.sh
			bash /vagrant/haproxy_setup.sh
			sudo reboot
		SHELL
		
	end
	
	config.vm.define "client" do |client|
	client.vm.box = "ubuntu/jammy64"
		
		client.vm.network "private_network", ip: "172.20.30.10"
		client.vm.provider "virtualbox" do |vb|
			vb.name = "client"
			vb.memory = 2048
			vb.cpus = 1
		end
		client.vm.hostname = "client"
		client.vm.synced_folder shared_folder, "/vagrant"
		
		client.vm.provision "shell", inline: <<-SHELL
			chmod +x /vagrant/*.sh
			bash /vagrant/setup.sh
			bash /vagrant/client_setup.sh
			sudo reboot
		SHELL
		
	end
	
end