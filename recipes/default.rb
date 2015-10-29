#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"

package 'nginx' do
  action :install
end

service 'nginx' do
  action [:start, :enable]
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  mode '0444'
  owner 'root'
  group 'root'
end

file '/usr/share/nginx/html/index.html' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end

