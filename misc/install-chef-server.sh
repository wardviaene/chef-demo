#!/bin/sh
sudo -s
cat /vagrant/chef-demo/misc/hosts >> /etc/hosts
dpkg -i /vagrant/chef-server-core_*_amd64.deb
chef-server-ctl reconfigure
chef-server-ctl user-create admin admin admin admin@example.com LearnDevOps -f admin.pem
chef-server-ctl org-create learndevops "learn DevOps Course" --association_user admin -f org.pem
cp admin.pem org.pem /vagrant/
