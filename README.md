#Ansible Scripts for Open LMIS

This provision project is build for [elmis](https://github.com/USAID-DELIVER-PROJECT/elmis) project.

##System requirements
* JDK 7
* Postgresql 9
* Git
* Gradle 2.3
* Nodejs
* Grunt CLI
* Karma

Instead of installing these requirements one by one. Ansible can help us do the annoying jobs for us. Here are some instructions.

## Using Ansible with vagrant
We want to keep the develop environment all the same. Vagrant provisioned with Ansible is a good choice.

### Requirements for your local machine

#### Install latest Ansible
Before you use Ansible for provision. You should install Ansible in your local environment.

Assuming your local machine is MacOS, install the latest releases via pip:

```
$ sudo easy_install pip
$ sudo pip install ansible
```

Want to install in Ubuntu etc.? Read [Official instruction](http://docs.ansible.com/intro_installation.html)

#### Install SSHPASS

Ansible will use ssh to login your virtual machine. SSHPASS should be installed in advance.

Read [SSHPASS install instruction] (https://gist.github.com/arunoda/7790979)

### Run your virtual machine

Navigating to the OpenLMS-TechOps root directory, run `vagrant up`. Ansible will install all packages you declared in `provisioning/playbook.yml` file.

If your machine is already running, you want to provision again, just need to run `vagrant provision`. More vagrant commands read [here](http://docs.vagrantup.com/v2/cli/).

##Supports

### Provision more dependencies
If you want to add more dependencies to install.

#### Install via ansible-playbooks

Find the awesome [Ansible Playbooks](https://github.com/snowplow/ansible-playbooks). You can find most common tools/dependencies. Copy the specific role under `ansible-playbooks/roles` to `OpenLMS-TechOps/provisioning/roles/`. And add the role to your `provisioning/playbook.yml`.

See example in this commit [Add karma to provision](https://github.com/gongmingqm10/OpenLMIS-TechOps/commit/d074174cd2285df6dc5ba64e27aaa033547f1211).

#### Install via ansible-galaxy

Browse all the ansible roles in [Galaxy Ansible](https://galaxy.ansible.com/list#/roles).

Please find [install_via_galaxy_role.md](https://github.com/gongmingqm10/OpenLMIS-TechOps/blob/master/install_via_galaxy_roles.md)

### Issues you may occurred
When your vagrant machine is running. Ansible will connect to your vagrant file for provision. If you get the error `Host key verification failed` during `vagrant up` or `vagrant provision`, please run the comand `ssh-keygen -R hostname`, the hostname is the address for your virtual machine, like `192.168.33.10`.
