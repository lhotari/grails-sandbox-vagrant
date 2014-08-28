#!/bin/bash
vagrant ssh -c "sudo dpkg --purge virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11"
# vagrant plugin install vagrant-vbguest
vagrant vbguest --do install -R
