# Ansible in AWS

We use Ansible to provision our AWS machines.

## For UAT environment

UAT environment should run jenkins-ci. So we need web, jenkins, tomcat, android environment

### Requirement

* JDK 7
* Postgresql 9
* Gradle 2.3
* Nodejs
* Grunt CLI
* Karma
* Tomcat7
* Jenkins
* Android

### Install Ansible in Ubuntu

```
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

### Install git clone the techops repository

Install git `sudo apt-get install git`, and clone the [repo](https://github.com/gongmingqm10/OpenLMIS-TechOps).

### Install Galaxy Ansible roles

```
$ cd provisioning
$ sudo ansible-galaxy install -r galaxy-roles.txt --force
```

### Run Ansible

```
ansible-playbook aws-uat-playbook.yml --connection=local
```

## For QA environment

UAT environment should host the website. So we need web, tomcat

### Requirement

* JDK 7
* Postgresql 9
* Gradle 2.3
* Tomcat7

### Install Ansible in Ubuntu

```
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

### Install git clone the techops repository

Install git `sudo apt-get install git`, and clone the [repo](https://github.com/gongmingqm10/OpenLMIS-TechOps).

### Install Galaxy Tomcat roles

```
$ cd provisioning
$ ansible-galaxy install stumptownlabs.tomcat
```

### Run Ansible

```
ansible-playbook aws-qa-playbook.yml --connection=local
```
