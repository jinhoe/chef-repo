#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

haproxy_install 'package'

haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'server_backend'
end

# haproxy_backend 'server_backend' do
#   server [
#     'ec2-44-204-237-246.compute-1.amazonaws.com 44.204.237.246:80 maxconn 32',
#     'ec2-107-20-104-51.compute-1.amazonaws.com 107.20.104.51:80 maxconn 32'
#   ]
# end

web_nodes = search('node','policy_name:company_web')

server_array = []

web_nodes.each do |one_node|
  one_server = "#{one_node['cloud']['public_hostname']} #{one_node['cloud']['public_ipv4']}:80 maxconn 32"
  server_array.push(one_server)
end

haproxy_backend 'server_backend' do
  server server_array
end

haproxy_service 'haproxy'
