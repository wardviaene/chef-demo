#
# Cookbook Name:: my_cookbook
# Recipe:: app_deploy
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"

apt_repository "example-app" do
  uri "http://192.168.0.252"
  distribution "trusty"
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "8D53BAA5"
end

package 'example-app' do
  action :install
end

directory '/usr/share/example-app/' do
  owner 'example-app'
  group 'example-app'
  recursive true
end

service 'example-app' do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end
