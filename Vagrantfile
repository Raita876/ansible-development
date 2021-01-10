Vagrant.configure("2") do |config|
  config.vm.box = "#{ENV['ANSIBLE_DEV_UBUNTU_BOX']}"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.disksize.size = "#{ENV['ANSIBLE_DEV_DISK_SIZE']}"

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
