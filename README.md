grails-sandbox-vagrant
======================

Vagrant VM configuration for running Grails in a VM.
I use a VM for running test apps from Grails Jira issues in a sandbox.

Requirements:
* Vagrant 1.1 or newer, see http://docs.vagrantup.com/v2/installation/
* apt-cacher-ng or other http proxy for caching deb updates (running on port 3142)
* vagrant vbguest plugin

To install vagrant vbguest plugin:
`vagrant vbguest --do install -R`

To install apt-cacher-ng on Ubuntu host:
`sudo apt-get install apt-cacher-ng`
allow GVM to use the same proxy for caching Grails download:
`echo "PfilePattern = .*" | sudo tee -a /etc/apt-cacher-ng/acng.conf`
make sure you protect your host with a firewall (`sudo ufw enable`) since apt-cacher-ng is open to all by default.

First usage:
```
vagrant up
# wait until all installations have completed and the VM has rebooted
./update_guest_additions.sh
vagrant halt
vagrant up
```
