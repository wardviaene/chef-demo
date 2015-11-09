require 'chef/provisioning/docker_driver'

machine_image 'webserver' do
  recipe 'my_cookbook'

  machine_options :docker_options => {
      :base_image => {
          :name => 'ubuntu',
          :repository => 'ubuntu',
          :tag => '14.04'
      },
      :ports => "8080:80",
  }
end

machine 'webserver1' do
  from_image 'webserver'
end
