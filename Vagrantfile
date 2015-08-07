# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "openlmis-box"

  config.vm.synced_folder "shared", "/home/vagrant/Shared"
  config.vm.synced_folder "projects", "/home/vagrant/Projects"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/vagrant-playbook.yml"
    ansible.verbose = true
  end
end
