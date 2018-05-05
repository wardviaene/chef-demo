#!/bin/bash
sudo -s
cat /vagrant/chef-demo/misc/hosts >> /etc/hosts
exit
cp /vagrant/*.pem .
cp /vagrant/chef-demo/misc/knife.rb .chef/knife.rb
knife ssl fetch
knife client list
knife bootstrap node.example.com -N node -x vagrant --sudo
cd ~/cookbooks
knife cookbook upload apt
knife cookbook upload my_cookbook
knife node run_list set node 'recipe[my_cookbook]'
ssh node 'sudo chef-client'
curl node
cp /vagrant/chef-demo/misc/webserver-role.json .
cp /vagrant/chef-demo/attributes/ my_cookbook/ -r 
cp /vagrant/chef-demo/templates my_cookbook/ -r 
cp /vagrant/chef-demo/recipes/default.rb my_cookbook/recipes/default.rb 
# change cookbook metadata.rb and incrase version number
knife cookbook upload my_cookbook
knife role from file webserver-role.json
knife node run_list set node 'role[webserver]'
ssh node 'sudo chef-client'
