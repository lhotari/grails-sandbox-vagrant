#!/usr/bin/env bash

set -x
export DEBIAN_FRONTEND=noninteractive

if [ ! -e "/home/vagrant/.firstboot" ]; then
  # update us. -> fi. in apt sources.list to use APT server from Finland
  perl -i -p -e 's/\/\/us\./\/\/fi./g' /etc/apt/sources.list
  # remove ufw firewall
  dpkg --purge ufw

  apt-get update
 
  apt-get install -y --force-yes  ethtool

  # configure ethtool , disable tcp offloading in virtual ethernet adapter
cat >> /etc/network/interfaces.d/eth0.cfg <<EOF2
post-up /sbin/ethtool --offload eth0 gso off tso off sg off gro off || true
pre-up /sbin/ethtool --offload eth0 gso off tso off sg off gro off || true
EOF2
  /sbin/ethtool --offload eth0 gso off tso off sg off gro off

  # upgrade all packages
  apt-get upgrade -q -y --force-yes
  apt-get dist-upgrade -q -y --force-yes

  # install required packages
  apt-get install -y --force-yes vim acpid software-properties-common curl unzip python-software-properties git

  # java 7
  add-apt-repository ppa:webupd8team/java
  apt-get update
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
  ( cd /var/cache/oracle-jdk7-installer && find -mindepth 1 -maxdepth 1 -not -name "jdk*" -exec rm -rf {} \; )
  apt-get install -y --force-yes oracle-java7-installer

  # Install GVM & Grails
  mv /home/vagrant/.gvm{,.old}
  su -l -c "curl -s get.gvmtool.net | bash" vagrant
  rmdir /home/vagrant/.gvm/archives
  mv /home/vagrant/.gvm.old/* /home/vagrant/.gvm/
  rmdir /home/vagrant/.gvm.old
  su -l -c "perl -i -p -e 's/gvm_auto_answer=false/gvm_auto_answer=true/' ~/.gvm/etc/config" vagrant  
  su -l -c "gvm install grails" vagrant

  touch /home/vagrant/.firstboot
  reboot
fi
