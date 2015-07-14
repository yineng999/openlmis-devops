#Install Dependencies via Galaxy Ansible

We will get how to provision via [Galaxy Ansible](https://galaxy.ansible.com/list#/roles).

##Requirements for your local machine

The requirement is same as described in `README.md`, install Ansible in your local machine.

Follow this [instruction](http://docs.ansible.com/intro_installation.html).

##Install Ansible roles
Find all the role I need to install:

* `Java7`: geerlingguy.java
* `Gradle2.3`: MagneDavidsen.gradle
* `postgresql9`: nickjj.postgres
* `git`: geerlingguy.git
* `nodejs`: geerlingguy.nodejs

requirement.txt
```
geerlingguy.java
MagneDavidsen.gradle
nickjj.postgres
geerlingguy.git
geerlingguy.nodejs
```

Install all the role declared in requirement.txt: `sudo ansible-galaxy install -r requirement.txt --force`

##Install dependencies

After we finished roles installaton, below is what we declared in `playbook.yml`:

```
---
- hosts: all
  sudo: yes
  roles:
    - base
    - { role: briancoca.oracle_java7 }
    - { role: MagneDavidsen.gradle, gradle_version: "2.3" }
    - { role: nickjj.postgres }
    - { role: geerlingguy.git }
    - { role: geerlingguy.nodejs }
```

What's next? Follow the `README.md`, use it with vagrant.

Further, you can run it with `ansible-playbook playbook.yml --connection=local`, but this will install all the package in local machine.
