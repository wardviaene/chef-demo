# Remove older chef version
$script = <<SCRIPT
echo Removing older chef version...
sudo apt-get -y remove chef chef-zero
sudo dpkg --purge chef
sudo rm -rf /etc/chef
SCRIPT

Vagrant.configure(2) do |config|
  config.vm.define "node" do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.network "private_network", ip: "192.168.0.3"
    node.vm.hostname = "node.example.com"
    node.vm.provision "shell", inline: $script
  end
  config.vm.define "workstation" do |workstation|
    workstation.vm.box = "ubuntu/trusty64"
    workstation.vm.network "private_network", ip: "192.168.0.252"
    workstation.vm.hostname = "workstation.example.com"
    workstation.vm.provision "shell", inline: $script
  end
  config.vm.define "chef" do |chef|
    chef.vm.box = "ubuntu/trusty64"
    chef.vm.network "private_network", ip: "192.168.0.253"
    chef.vm.hostname = "chef.example.com"
    chef.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 2
    end
  end
end
