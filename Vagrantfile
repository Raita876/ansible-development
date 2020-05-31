Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "private_network", ip: "192.168.33.10"

  if Vagrant::Util::Platform.windows? then
    config.vm.synced_folder "#{ENV['USERPROFILE']}", "/mnt/vagrant"
  else
    config.vm.synced_folder "~", "/mnt/vagrant"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "setup.yaml"
  end
end
