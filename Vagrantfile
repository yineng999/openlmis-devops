# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  # config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    # ansible.extra_vars = { ansible_ssh_host: '192.168.33.10', ansible_ssh_user: 'vagrant', ansible_ssh_pass: 'vagrant' }
  end
end
