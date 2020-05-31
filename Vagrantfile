Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.network :forwarded_port, guest: 3000, host: 13000

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "setup.yaml"
  end
end
