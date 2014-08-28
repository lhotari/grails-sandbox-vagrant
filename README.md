grails-sandbox-vagrant
======================

Vagrant VM configuration for running Grails in a VM.
I use a VM for running test apps from Grails Jira issues in a sandbox.

Requirements:
* Vagrant 1.6.3+ , see http://docs.vagrantup.com/v2/installation/
* VirtualBox 4.3.14+ , see https://www.virtualbox.org/wiki/Downloads
* vagrant [vbguest plugin](https://github.com/dotless-de/vagrant-vbguest)
* vagrant [cachier plugin](http://fgrehm.viewdocs.io/vagrant-cachier)

To install required vagrant plugins:
```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-cachier
```

First usage:
```
vagrant up
# wait until all installations have completed and the VM has rebooted
./update_guest_additions.sh
vagrant halt
vagrant up
```