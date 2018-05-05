#!/bin/bash
sudo dpkg -i /vagrant/chefdk_*_amd64.deb
mkdir -p ~/.chef
echo "cookbook_path ['/home/vagrant/cookbooks']" > ~/.chef/knife.rb
mkdir -p ~/cookbooks
cd ~/cookbooks
chef generate cookbook my_cookbook
cp /vagrant/chef-demo/recipes/default.rb my_cookbook/recipes/
berks vendor
mv berks-cookbooks/apt/ ..
cd ..
sudo chef-client -z --runlist 'recipe[my_cookbook]'
curl localhost
