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

### Install Ansible in your local machine
Before you use Ansible for provision. You should install Ansible in your local environment.

Assuming your local machine is MacOS, install the latest releases via pip:

```
$ sudo easy_install pip
$ sudo pip install ansible
```

Want to install in Ubuntu etc.? Read [Official instruction](http://docs.ansible.com/intro_installation.html)

### Run your machine

Navigating to the OpenLMS-TechOps root directory, run `vagrant up`. Ansible will install everything you declared in `provisioning/playbook.yml` file.

If your machine is already running, you want to provision again, just need to run `vagrant provision`. More vagrant commands read [here](http://docs.vagrantup.com/v2/cli/).

### Issues you may occurred
When your vagrant machine is running. Ansible will connect to your vagrant file for provision. If you get the error `Host key verification failed` during `vagrant up` or `vagrant provision`, please run the comand `ssh-keygen -R 192.168.33.10`, the IP address is what you set for vagrant machine in `Vagrantfile`.
