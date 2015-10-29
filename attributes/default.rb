default[:nginx][:user] = "www-data"
default[:nginx][:worker_processes] = "2"
default[:nginx][:pid] = "/run/nginx.pid"
default[:nginx][:worker_connections] = "768"
