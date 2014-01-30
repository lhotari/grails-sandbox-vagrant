grails-sandbox-vagrant
======================

Vagrant VM configuration for running Grails in a VM.
I use a VM for running test apps from Grails Jira issues in a sandbox.

Requirements:
* Vagrant 1.1 or newer, see http://docs.vagrantup.com/v2/installation/
* http proxy for caching deb updates (running on port 3128)
* vagrant vbguest plugin

To install vagrant vbguest plugin:
`vagrant plugin install vagrant-vbguest`

To install squid 2.7 on MacOSX host:
```
brew install homebrew/versions/squid2
cp squid-config/storeurl-rewrite.py /usr/local/etc
cp squid-config/squid.conf /usr/local/opt/squid2/etc/squid.conf
echo "visible_hostname `hostname`" >> /usr/local/opt/squid2/etc/squid.conf
cp squid-config/homebrew.mxcl.squid2.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.squid2.plist
```
squid3 doesn't support store url rewriting that is required for caching Java downloads.

First usage:
```
vagrant up
# wait until all installations have completed and the VM has rebooted
./update_guest_additions.sh
vagrant halt
vagrant up
```